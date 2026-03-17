import 'package:flutter/material.dart';

// text النص لتقليل حجم الاكواد داخل الصفحات الرئيسية
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.weight,
    this.maxLines,
  });

  final String text;
  final double size;
  final Color? color;
  final FontWeight? weight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
