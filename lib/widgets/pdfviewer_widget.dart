import 'package:flutter/material.dart';
import 'package:portfolio_website_for_linkedin/constants/free_strings.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/widgets.dart';

class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget({super.key});

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: MediaQuery.of(context).size.width*0.8,
      height: 900,
      child: SfPdfViewer.asset(
        resumeUrl,
      )
    );
  }
}
