import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:share/share.dart';

class Invoice extends StatelessWidget {
  final String pdfPath;
  Invoice(this.pdfPath);
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'INVOICE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.shareFiles([pdfPath]);
            },
          ),
        ],
      ),
      path: pdfPath,
    );
  }
}
