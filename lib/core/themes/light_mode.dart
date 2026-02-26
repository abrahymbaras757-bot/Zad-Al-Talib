import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(216, 245, 247, 250), // خلفية التطبيق
    primary: Color(0xff334155), // AppBar, Buttons الأساسية
    secondary: Color(0xff16A34A), // أزرار التأكيد (حفظ، إرسال…)
    tertiary: Color(0xff0F766E), // Chips, Badges, Icons مساعدة
    inversePrimary: Color(0xffF8FAFC), // نصوص فوق primary
    error: Color(0xffDC2626), // الأخطاء
    outline: Color(0xffE2E8F0), // حدود الحقول و الكروت
    surfaceVariant: Color(0xffFFFFFF), // الكروت و TextFields
  ),
);
