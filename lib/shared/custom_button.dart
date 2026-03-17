import 'package:flutter/material.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.color,
    required this.text,
    this.onTap,
  });
  final double width;
  final Color color;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // ignore: dead_null_aware_expression
          color: color ?? Colors.white,
        ),
        child: Center(
          child: CustomText(
            text: text,
            size: 18,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
