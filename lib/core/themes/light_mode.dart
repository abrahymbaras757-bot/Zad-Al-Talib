import 'package:flutter/material.dart';

// اعدادات الوضع الفاتح
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255), // خلفية التطبيق
    primary: Color(0xff334155), // AppBar, Buttons الأساسية
    secondary: Color(0xff16A34A), // أزرار التأكيد (حفظ، إرسال…)
    tertiary: Color(0xff0F766E), // Chips, Badges, Icons مساعدة
    inversePrimary: Color.fromARGB(255, 255, 255, 255), // نصوص فوق primary
    error: Color(0xffDC2626), // الأخطاء
    outline: Color.fromARGB(255, 255, 255, 255), // حدود الحقول و الكروت
    // ignore: deprecated_member_use
    surfaceVariant: Color(0xffFFFFFF), // الكروت و TextFields
    onSurface: Color(0xff1E293B), // لون النص الأساسي فوق الخلفيات الفاتحة
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Color(0xff1E293B), // لون عنوان الكرت
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 153, 160, 168), // لون وصف الكرت
    ),
  ),
);
