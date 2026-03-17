import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.ispassword,
    required this.controller,
    this.sideColor,
    this.hintColor,
    this.iconColor,
    this.textColor,
    this.width,
    this.height,
    this.maxLines,
  });
  final String hint;
  final bool ispassword;
  final TextEditingController controller;
  final Color? sideColor;
  final Color? hintColor;
  final Color? iconColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final int? maxLines;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.ispassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // اتجاه انص
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextFormField(
          controller: widget.controller,
          cursorHeight: 20,
          maxLines: widget.maxLines ?? 1,
          // ignore: body_might_complete_normally_nullable
          validator: (v) {
            if (v == null || v.isEmpty) {
              return ' يرجى إدخال ${widget.hint}';
            }
            null;
          },

          cursorColor: Theme.of(context).colorScheme.primary,
          obscureText: _obscureText,
          style: TextStyle(color: widget.textColor ?? Colors.white),
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.green),
            suffixIcon: widget.ispassword
                ? GestureDetector(
                    onTap: _togglePassword,
                    child: Icon(
                      _obscureText
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      //CupertinoIcons.eye,
                      color: widget.iconColor ?? Colors.white,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: widget.sideColor ?? Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: widget.sideColor ?? Colors.white),
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(color: widget.hintColor ?? Colors.white),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
      ),
    );
  }
}
