import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/providers/course_provider.dart';

void addPdfContent({
  required BuildContext context,
  required String courseId,
  required String pdfTitle,
  required String pdfPath,
}) {
  if (pdfTitle.isEmpty) return;

  final provider = Provider.of<CourseProvider>(context, listen: false);
  provider.addPdf(courseId, pdfTitle, pdfPath);
}

void addYoutubeContent({
  required BuildContext context,
  required String courseId,
  required String title,
  required String link,
}) {
  if (title.isEmpty || link.isEmpty) return;

  final provider = Provider.of<CourseProvider>(context, listen: false);
  provider.addYoutube(courseId, title, link);
}
