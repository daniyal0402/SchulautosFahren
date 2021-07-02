import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class zzzzzzzzzzzzzzzzz extends StatefulWidget {
  final Map<String, dynamic> zzzzzzzzzzzzzzzzzzz;
  final List<Uint8List> zzzzzzzzzzzzzzzzzzzz;
  final BuildContext zzzzzzzzzzzzzzzzzzzzz;
  zzzzzzzzzzzzzzzzz(this.zzzzzzzzzzzzzzzzzzzz, this.zzzzzzzzzzzzzzzzzzz,
      this.zzzzzzzzzzzzzzzzzzzzz);

  zzzzzzzzzzzzzzzzzz createState() => zzzzzzzzzzzzzzzzzz(
      zzzzzzzzzzzzzzzzzzzz, zzzzzzzzzzzzzzzzzzz, zzzzzzzzzzzzzzzzzzzzz);
}

class zzzzzzzzzzzzzzzzzz extends State<zzzzzzzzzzzzzzzzz> {
  String zzzzzzzzzzzzzzzzzzzzzzzzz;
  final Map<String, dynamic> zzzzzzzzzzzzzzzzzzz;
  final List<Uint8List> zzzzzzzzzzzzzzzzzzzz;
  final BuildContext zzzzzzzzzzzzzzzzzzzzz;
  final pdf = pw.Document();
  zzzzzzzzzzzzzzzzzz(this.zzzzzzzzzzzzzzzzzzzz, this.zzzzzzzzzzzzzzzzzzz,
      this.zzzzzzzzzzzzzzzzzzzzz);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: PdfPreview(
            build: (format) => _generatePdf(format, "Title"),
          ),
        ),
      ],
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            pw.Table(
              border: pw.TableBorder.all(width: 3),
              children: [
                getStrings("Pries"),
                getStrings("Abdabe Datum"),
                getStrings("Mehrwersteuer"),
                getStrings("Marke"),
                getStrings("Model"),
                getStrings("Erstzulassung"),
                getStrings("Bauform"),
                getStrings("Modellvariante"),
                getStrings("Typ"),
                getStrings("Kilometer"),
                getStrings("Fahrschule/Firma Name"),
                getStrings("Adresse Str Hr"),
                getStrings("PLZ"),
                getStrings("Ort"),
                getStrings("Telefon / Handynummer"),
                getStrings("Email"),
                getStrings("Ansprechpartner"),
              ],
            ),
          ];
        },
      ),
    );
    for (int i = 0; i < zzzzzzzzzzzzzzzzzzzz.length; i++) {
      var image = PdfImage.file(pdf.document, bytes: zzzzzzzzzzzzzzzzzzzz[i]);
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.AspectRatio(
              aspectRatio: 3 / 2,
              child: pw.Image(image),
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  pw.TableRow getStrings(String what) {
    return pw.TableRow(
      children: [
        pw.Container(
          padding: pw.EdgeInsets.all(5),
          child: getString(what),
        ),
        pw.Container(
          alignment: pw.Alignment.center,
          padding: pw.EdgeInsets.all(5),
          child: getString(zzzzzzzzzzzzzzzzzzz[what]),
        ),
      ],
    );
  }

  pw.Text getString(String what) {
    return pw.Text(
      what,
      style: pw.TextStyle(
        fontSize: 20,
        fontWeight: pw.FontWeight.bold,
      ),
    );
  }
}
