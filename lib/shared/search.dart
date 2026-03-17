import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.controller,
    this.onTap,
    this.onChanged,
    required this.hintText,
    this.color,
  });
  final String hintText;
  final TextEditingController controller;
  final Color? color;
  final Function()? onTap;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Material(
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        child: TextField(
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(fontSize: 19),
            // ignore: deprecated_member_use
            fillColor: Theme.of(context).colorScheme.surfaceVariant,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
