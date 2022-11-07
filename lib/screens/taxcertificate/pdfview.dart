import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents PdfView for Navigation
class PdfView extends StatefulWidget {
  final path;
  const PdfView({Key? key, required this.path}) : super(key: key);
  @override
  _PdfView createState() => _PdfView();
}

class _PdfView extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("NEW PATH : " + widget.path);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
            // _key.currentState!.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                width: 25,
                child: Image.asset(
                  'assets/slicing/Untitled-3.png',
                )),
          ),
        ),
        title: const Text('Your Text Certificate'),
      ),
      body: SfPdfViewer.network(
        widget.path,
        key: _pdfViewerKey,
      ),
    );
  }
}
