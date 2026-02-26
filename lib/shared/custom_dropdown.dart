import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.helper, // نص توضيحي
    required this.labeltext, // القيمة المختارة في القائمة بشكل افتراضي
    this.onSelected,
    required this.items,
    this.labelColor,
    this.helperColor,
    this.sideColor,
    this.textColor, // قائمة من الخيارات
  });

  final String? helper;
  final String labeltext;
  final List<String> items;
  final Function(String?)? onSelected;
  final Color? labelColor;
  final Color? helperColor;
  final Color? sideColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: labelColor ?? Colors.white),
          helperStyle: TextStyle(color: helperColor ?? Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: sideColor ?? Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: sideColor ?? Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: sideColor ?? Colors.white),
          ),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownMenu(
          label: Text(labeltext), // قيمة تلقائية
          helperText: helper, // نص مساعدة او توضيحي
          width: 350,
          onSelected: onSelected,
          textStyle: TextStyle(
            color: textColor ?? Colors.white,
          ), // لون النص المختار
          dropdownMenuEntries: items.map((item) {
            return DropdownMenuEntry<String>(value: item, label: item);
          }).toList(),
        ),
      ),
    );
  }
}
