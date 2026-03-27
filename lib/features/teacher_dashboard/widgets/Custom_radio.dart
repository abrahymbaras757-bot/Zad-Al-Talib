// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:zad_altalib/shared/enums/ContentType.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.titleColor,
  });
  final String title;
  final ContentType value;
  final ContentType? groupValue;
  final Color? titleColor;
  final ValueChanged<ContentType?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RadioListTile<ContentType>(
        title: Text(title, style: TextStyle(color: titleColor ?? Colors.white)),
        value: value,
        // ignore: deprecated_member_use
        groupValue: groupValue,
        // ignore: deprecated_member_use
        onChanged: onChanged,

        //activeColor: Colors.teal, // تغير الون عند الاختيار
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return Theme.of(context).colorScheme.tertiary;
          }
          return Theme.of(context).colorScheme.inversePrimary;
        }),
      ),
    );
  }
}
