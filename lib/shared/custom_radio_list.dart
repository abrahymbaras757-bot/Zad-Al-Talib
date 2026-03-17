import 'package:zad_altalib/shared/enums/option.dart';
import 'package:flutter/material.dart';

class CustomRadioList extends StatelessWidget {
  const CustomRadioList({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.titleColor,
  });
  final String title;
  final Option value;
  final Option? groupValue;
  final Color? titleColor;
  final ValueChanged<Option?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RadioListTile<Option>(
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
