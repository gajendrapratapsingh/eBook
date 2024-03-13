import 'package:country_code_picker/country_code_picker.dart';
import 'package:ebook/localization/Demo_Localization.dart';
import 'package:ebook/localization/language_constants.dart';
import 'package:ebook/screen/Splash/splashScreen.dart';
import 'package:ebook/theme/themes.dart';
import 'package:ebook/utils/routes/pages.dart';
import 'package:ebook/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'helper/Constant.dart';
import 'helper/String.dart';

void main() async{
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}
// global variable for language define here

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;

  Locale? _locale;
  bool? lan;

  @override
  initState() {
    getDarkMode();
    super.initState();
  }

  setLocale(Locale locale) {
    setState(
          () {
        _locale = locale;
      },
    );
  }

  @override
  void didChangeDependencies() {
    setState(
          () {
        getLocale().then(
              (locale) {
            setState(
                  () {
                _locale = locale;
              },
            );
          },
        );
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: 'eBook Stories',
    //   debugShowCheckedModeBanner: false,
    //   //theme: AppTheme.lightTheme(context),
    //   theme: lightMode, // Use default theme initially
    //   darkTheme: darkMode,
    //   themeMode: ThemeMode.system, // Use system theme initially
    //   // theme: ThemeData(
    //   //     primarySwatch: Colors.amber,
    //   //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   //     fontFamily: "SourceSansPro"
    //   // ),
    //   getPages: Pages.list,
    //   initialRoute: Routes.splashScreen,
    //   initialBinding: MyBinding(),
    // );
    return MaterialApp(
      title: appName,
      theme: dark_mode
          ? ThemeData(brightness: Brightness.light)
          : ThemeData(brightness: Brightness.dark),
      locale: _locale,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        DemoLocalization.delegate,
        //GlobalMaterialLocalizations.delegate,
        //GlobalWidgetsLocalizations.delegate,
        //GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("zh", "CN"),
        Locale("es", "ES"),
        Locale("hi", "IN"),
        Locale("ar", "DZ"),
        Locale("ru", "RU"),
        Locale("ja", "JP"),
        Locale("de", "DE")
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

  //set title for indicator page
  getDarkMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dark_mode = preferences.getBool("Dark_Mode") ?? true;
    return dark_mode;
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'eBook Stories',
//       debugShowCheckedModeBanner: false,
//       //theme: AppTheme.lightTheme(context),
//       theme: lightMode, // Use default theme initially
//       darkTheme: darkMode,
//       themeMode: ThemeMode.system, // Use system theme initially
//       // theme: ThemeData(
//       //     primarySwatch: Colors.amber,
//       //     visualDensity: VisualDensity.adaptivePlatformDensity,
//       //     fontFamily: "SourceSansPro"
//       // ),
//       getPages: Pages.list,
//       initialRoute: Routes.splashScreen,
//       initialBinding: MyBinding(),
//     );
//   }
// }
