import 'package:flutter/material.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class RowTwoParts extends StatelessWidget {
  const RowTwoParts({super.key, required this.titel, required this.text});
  final String titel;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: titel,
          size: 18,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        SizedBox(width: 5),
        CustomText(
          text: text,
          size: 18,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
