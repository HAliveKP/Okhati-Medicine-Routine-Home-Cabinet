import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:okhati/l10n/app_localizations.dart';
import 'package:okhati/features/history/domain/models/dose_log.dart';
import 'package:okhati/features/history/presentation/history_provider.dart';
import 'package:okhati/features/history/presentation/widgets/pdf_generator.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final dateRange = ref.watch(historyDateRangeProvider);
    final logsAsync = ref.watch(doseLogsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.historyTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            tooltip: t.exportPdf,
            onPressed: () async {
              final pickedRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime.now().add(const Duration(days: 1)),
                initialDateRange: DateTimeRange(
                  start: dateRange.startDate,
                  end: dateRange.endDate,
                ),
              );

              if (pickedRange != null) {
                ref.read(historyDateRangeProvider.notifier).state = DateRangeState(
                  startDate: pickedRange.start,
                  endDate: DateTime(pickedRange.end.year, pickedRange.end.month, pickedRange.end.day, 23, 59, 59),
                );

                final repository = ref.read(historyRepositoryProvider);
                final profileId = ref.read(activeProfileIdProvider);
                final logs = await repository.getDoseLogs(
                  profileId,
                  pickedRange.start,
                  DateTime(pickedRange.end.year, pickedRange.end.month, pickedRange.end.day, 23, 59, 59),
                );

                final adherence = calculateAdherence(logs);

                final statusLabels = {
                  DoseStatus.taken: t.statusTaken,
                  DoseStatus.missed: t.statusMissed,
                  DoseStatus.skipped: t.statusSkipped,
                };

                final pdfBytes = await generateDoseHistoryPdf(
                  profileName: profileId,
                  startDate: pickedRange.start,
                  endDate: pickedRange.end,
                  logs: logs,
                  adherencePercentage: adherence,
                  titleText: t.pdfTitle,
                  profileLabel: t.profileLabel,
                  dateRangeLabel: t.dateRangeLabel,
                  adherenceLabel: t.adherenceLabel,
                  tableDateHeader: t.tableDate,
                  tableTimeHeader: t.tableTime,
                  tableMedicineHeader: t.tableMedicine,
                  tableStatusHeader: t.tableStatus,
                  footerText: t.pdfFooter,
                  statusLabels: statusLabels,
                );

                await Printing.layoutPdf(
                  onLayout: (format) => Future.value(pdfBytes),
                  name: 'dose_history_${DateFormat('yyyyMMdd').format(pickedRange.start)}.pdf',
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${DateFormat('yyyy-MM-dd').format(dateRange.startDate)} - ${DateFormat('yyyy-MM-dd').format(dateRange.endDate)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () async {
                    final pickedRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now().add(const Duration(days: 1)),
                      initialDateRange: DateTimeRange(
                        start: dateRange.startDate,
                        end: dateRange.endDate,
                      ),
                    );
                    if (pickedRange != null) {
                      ref.read(historyDateRangeProvider.notifier).state = DateRangeState(
                        startDate: pickedRange.start,
                        endDate: DateTime(pickedRange.end.year, pickedRange.end.month, pickedRange.end.day, 23, 59, 59),
                      );
                    }
                  },
                  icon: const Icon(Icons.date_range),
                  label: Text(t.selectDateRange),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: logsAsync.when(
              data: (logs) {
                if (logs.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        t.noLogsInRange,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  );
                }

                final adherence = calculateAdherence(logs);

                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${t.adherenceLabel}: ${adherence.toStringAsFixed(1)}%',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: logs.length,
                        itemBuilder: (context, index) {
                          final log = logs[index];
                          final dateStr = DateFormat('yyyy-MM-dd HH:mm').format(log.scheduledAt);
                          String statusText = log.status.name;
                          if (log.status == DoseStatus.taken) statusText = t.statusTaken;
                          if (log.status == DoseStatus.missed) statusText = t.statusMissed;
                          if (log.status == DoseStatus.skipped) statusText = t.statusSkipped;

                          return ListTile(
                            leading: Icon(
                              log.status == DoseStatus.taken
                                  ? Icons.check_circle
                                  : log.status == DoseStatus.skipped
                                      ? Icons.remove_circle
                                      : Icons.cancel,
                              color: log.status == DoseStatus.taken
                                  ? Colors.green
                                  : log.status == DoseStatus.skipped
                                      ? Colors.orange
                                      : Colors.red,
                            ),
                            title: Text(log.medicineName),
                            subtitle: Text(dateStr),
                            trailing: Text(
                              statusText,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: log.status == DoseStatus.taken
                                    ? Colors.green
                                    : log.status == DoseStatus.skipped
                                        ? Colors.orange
                                        : Colors.red,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
