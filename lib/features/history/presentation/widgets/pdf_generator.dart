import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:okhati/features/history/domain/models/dose_log.dart';

Future<Uint8List> generateDoseHistoryPdf({
  required String profileName,
  required DateTime startDate,
  required DateTime endDate,
  required List<DoseLog> logs,
  required double adherencePercentage,
  required String titleText,
  required String profileLabel,
  required String dateRangeLabel,
  required String adherenceLabel,
  required String tableDateHeader,
  required String tableTimeHeader,
  required String tableMedicineHeader,
  required String tableStatusHeader,
  required String footerText,
  required Map<DoseStatus, String> statusLabels,
}) async {
  final pdf = pw.Document();

  // Load Noto Sans font supporting Devanagari (Nepali) & Latin
  final font = await PdfGoogleFonts.notoSansRegular();
  final boldFont = await PdfGoogleFonts.notoSansBold();

  final dateFormat = DateFormat('yyyy-MM-dd');
  final timeFormat = DateFormat('HH:mm');

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      theme: pw.ThemeData.withFont(
        base: font,
        bold: boldFont,
      ),
      build: (context) => [
        // Header Title
        pw.Header(
          level: 0,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                titleText,
                style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold, color: PdfColors.teal800),
              ),
              pw.Text(
                'Okhati',
                style: pw.TextStyle(fontSize: 16, color: PdfColors.grey700),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 10),

        // Metadata: Profile & Date Range & Adherence
        pw.Container(
          padding: const pw.EdgeInsets.all(10),
          decoration: const pw.BoxDecoration(
            color: PdfColors.grey200,
            borderRadius: pw.BorderRadius.all(pw.Radius.circular(8)),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                children: [
                  pw.Text('$profileLabel: ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(profileName),
                ],
              ),
              pw.SizedBox(height: 4),
              pw.Row(
                children: [
                  pw.Text('$dateRangeLabel: ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('${dateFormat.format(startDate)} to ${dateFormat.format(endDate)}'),
                ],
              ),
              pw.SizedBox(height: 4),
              pw.Row(
                children: [
                  pw.Text('$adherenceLabel: ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('${adherencePercentage.toStringAsFixed(1)}%'),
                ],
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 20),

        // Table
        logs.isEmpty
            ? pw.Center(
                child: pw.Padding(
                  padding: const pw.EdgeInsets.all(20),
                  child: pw.Text('No logs available for this range.'),
                ),
              )
            : pw.Table.fromTextArray(
                headers: [tableDateHeader, tableTimeHeader, tableMedicineHeader, tableStatusHeader],
                data: logs.map((log) {
                  return [
                    dateFormat.format(log.scheduledAt),
                    timeFormat.format(log.scheduledAt),
                    log.medicineName,
                    statusLabels[log.status] ?? log.status.name,
                  ];
                }).toList(),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.white),
                headerDecoration: const pw.BoxDecoration(color: PdfColors.teal700),
                rowDecoration: const pw.BoxDecoration(border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey300, width: 0.5))),
                cellAlignment: pw.Alignment.centerLeft,
                cellPadding: const pw.EdgeInsets.all(6),
              ),
      ],
      footer: (context) => pw.Container(
        alignment: pw.Alignment.center,
        margin: const pw.EdgeInsets.only(top: 20),
        child: pw.Text(
          footerText,
          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
        ),
      ),
    ),
  );

  return pdf.save();
}
