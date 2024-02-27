import 'package:ebook/theme/themes.dart';
import 'package:ebook/utils/routes/pages.dart';
import 'package:ebook/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ebook/bindings/my_bindings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'eBook Stories',
      debugShowCheckedModeBanner: false,
      //theme: AppTheme.lightTheme(context),
      theme: lightMode, // Use default theme initially
      darkTheme: darkMode,
      themeMode: ThemeMode.system, // Use system theme initially
      // theme: ThemeData(
      //     primarySwatch: Colors.amber,
      //     visualDensity: VisualDensity.adaptivePlatformDensity,
      //     fontFamily: "SourceSansPro"
      // ),
      getPages: Pages.list,
      initialRoute: Routes.splashScreen,
      initialBinding: MyBinding(),
    );
  }
}
