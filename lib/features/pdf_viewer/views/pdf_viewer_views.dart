import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:zad_altalib/shared/custom_text.dart';

// مكتمل
// صفحة عرض ال PDF
class PdfViewerViews extends StatefulWidget {
  const PdfViewerViews({
    super.key,
    required this.assetPath,
    required this.title,
  });
  final String assetPath;
  final String title;
  @override
  State<PdfViewerViews> createState() => _PdfViewerViewsState();
}

class _PdfViewerViewsState extends State<PdfViewerViews> {
  late PdfViewerController _controller;
  int totalPages = 0;
  int currentPage = 1;
  @override
  void initState() {
    super.initState();
    _controller = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: Stack(
        children: [
          SfPdfViewer.asset(
            widget.assetPath,
            controller: _controller,
            onDocumentLoaded: (details) {
              setState(() {
                totalPages = details.document.pages.count;
              });
            },
            onPageChanged: (details) {
              setState(() {
                currentPage = details.newPageNumber;
              });
            },
            canShowScrollHead: true,
            canShowScrollStatus: true,
            enableDoubleTapZooming: true,
          ),
          Positioned(
            top: 10,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomText(
                text: '$currentPage / $totalPages',
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.jumpToPage(1);
          //print(widget.assetPath);
        },
        child: Icon(Icons.first_page),
      ),
    );
  }
}
