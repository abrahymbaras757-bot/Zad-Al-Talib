import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Color(0xff121212), // خلفية التطبيق (Scaffold, خلفية الشاشة)
    primary: Color(0xff1E293B), // AppBar, BottomNavigationBar, Buttons الأساسية
    secondary: Color(0xff22C55E), // أزرار التأكيد (حفظ – تسجيل – إرسال)
    tertiary: Color(0xff0F766E), // عناصر مساعدة (Chips, Badges, Icons)
    inversePrimary: Color(0xffCBD5E1), // لون النص أو الأيقونة فوق primary
    error: Color(0xffF87171), // أخطاء، تنبيهات، Validation
    outline: Color(0xff334155), // حدود الحقول، الكروت، الـ Divider
    surfaceVariant: Color(0xff1E293B), // خلفية Cards, Containers, TextFields
  ),
);
