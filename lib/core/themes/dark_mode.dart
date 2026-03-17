import 'package:flutter/material.dart';

// اعدادات الوضع الداكن
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Color(0xff121212), // خلفية التطبيق (Scaffold, خلفية الشاشة)
    primary: Color(0xff1E293B), // AppBar, BottomNavigationBar, Buttons الأساسية
    secondary: Color(0xff22C55E), // أزرار التأكيد (حفظ – تسجيل – إرسال)
    tertiary: Color(0xff0F766E), // عناصر مساعدة (Chips, Badges, Icons)
    inversePrimary: Color(0xffCBD5E1), // لون النص أو الأيقونة فوق primary
    error: Color(0xffF87171), // أخطاء، تنبيهات، Validation
    outline: Color.fromARGB(
      255,
      14,
      18,
      24,
    ), // حدود الحقول، الكروت، الـ Divider
    // ignore: deprecated_member_use
    surfaceVariant: Colors.grey.shade900, // خلفية Cards, Containers, TextFields
    onSurface: Color.fromARGB(
      255,
      158,
      164,
      173,
    ), // لون النص الأساسي فوق الخلفيات الفاتحة
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 211, 212, 212), // لون عنوان الكرت
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 112, 127, 148), // لون وصف الكرت
    ),
  ),
);
