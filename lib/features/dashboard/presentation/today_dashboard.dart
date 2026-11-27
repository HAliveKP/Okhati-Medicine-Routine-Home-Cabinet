import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:okhati/features/dashboard/data/today_dose_repository.dart';
import 'package:okhati/features/dashboard/domain/today_dose.dart';

final todayDosesProvider = FutureProvider<List<TodayDose>>(
  (ref) => ref.watch(todayDoseRepositoryProvider).fetchToday(),
);

class TodayDashboard extends ConsumerWidget {
  const TodayDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = _DashboardWords(Localizations.localeOf(context).languageCode);
    final doses = ref.watch(todayDosesProvider);
    return doses.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(words.error),
          const SizedBox(height: 8),
          TextButton(onPressed: () => ref.invalidate(todayDosesProvider), child: Text(words.retry)),
        ]),
      ),
      data: (items) => items.isEmpty
          ? Center(child: Text(words.empty))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(DateTime.now()),
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                for (final period in DosePeriod.values)
                  _DoseSection(
                    period: period,
                    doses: items.where((dose) => dose.period == period).toList(),
                  ),
              ],
            ),
    );
  }
}

class _DashboardWords {
  _DashboardWords(String languageCode) : isNepali = languageCode == 'ne';
  final bool isNepali;
  String get morning => isNepali ? 'बिहान' : 'Morning';
  String get noon => isNepali ? 'दिउँसो' : 'Noon';
  String get night => isNepali ? 'राति' : 'Night';
  String get pending => isNepali ? 'बाँकी' : 'Pending';
  String get taken => isNepali ? 'खाएँ' : 'Taken';
  String get empty => isNepali ? 'आजका लागि औषधि तालिका छैन।' : 'No medicines scheduled for today.';
  String get error => isNepali ? 'आजका औषधि लोड गर्न सकिएन।' : 'Could not load today’s medicines.';
  String get noDoses => isNepali ? 'खुराक छैन' : 'No doses';
  String get retry => isNepali ? 'फेरि प्रयास' : 'Retry';
}

class _DoseSection extends StatelessWidget {
  const _DoseSection({required this.period, required this.doses});

  final DosePeriod period;
  final List<TodayDose> doses;

  @override
  Widget build(BuildContext context) {
    final words = _DashboardWords(Localizations.localeOf(context).languageCode);
    final title = switch (period) {
      DosePeriod.morning => words.morning,
      DosePeriod.noon => words.noon,
      DosePeriod.night => words.night,
    };
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (doses.isEmpty) Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(words.noDoses),
          ),
          for (final dose in doses)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(dose.medicineName),
              subtitle: Text('${dose.strength} · ${DateFormat.jm(Localizations.localeOf(context).toString()).format(dose.time)}'),
              trailing: Chip(
                label: Text(dose.status == DoseStatus.taken ? words.taken : words.pending),
              ),
            ),
        ]),
      ),
    );
  }
}
