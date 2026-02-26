import 'package:flutter/material.dart';

// text النص لتقليل حجم الاكواد داخل الصفحات الرئيسية
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    this.weight,
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
