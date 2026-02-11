import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/core/themes/theme_provider.dart';
import 'package:zad_altalib/features/auth/views/login_views.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //هنا متغير خاص ب لون التطبيق حسب الوضع
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: LoginViews(),
    );
  }
}
