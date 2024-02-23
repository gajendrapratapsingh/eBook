import 'package:ebook/ui/book_login.dart';
import 'package:ebook/ui/book_welcome.dart';
import 'package:ebook/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'eBook Stories',
      debugShowCheckedModeBanner: false,
      theme: lightMode, // Use default theme initially
      darkTheme: darkMode,
      themeMode: ThemeMode.system, // Use system theme initially
      // theme: ThemeData(
      //     primarySwatch: Colors.amber,
      //     visualDensity: VisualDensity.adaptivePlatformDensity,
      //     fontFamily: "SourceSansPro"
      // ),
      home: const WelcomeScreen(),
    );
  }
}
