import 'package:ebook/ui/book_home.dart';
import 'package:ebook/ui/book_login.dart';
import 'package:ebook/ui/book_read.dart';
import 'package:ebook/ui/book_signup.dart';
import 'package:ebook/ui/books_splash.dart';
import 'package:get/get.dart';
import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.registerScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => SignInScreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => BooksSplash(),
    ),
    GetPage(
      name: Routes.bookHomeScreen,
      page: () => BooksHome(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.bookReadScreen,
      page: () => BooksRead(),
      transition: Transition.rightToLeftWithFade,
      // binding: SplashBinding(),
    ),

  ];
}
