import 'package:ebook/ui/book_login.dart';
import 'package:ebook/ui/book_signup.dart';
import 'package:ebook/ui/complete_profile/complete_profile_screen.dart';
import 'package:ebook/ui/details/details_screen.dart';
import 'package:ebook/ui/forgot_password/forgot_password_screen.dart';
import 'package:ebook/ui/home/home_screen.dart';
import 'package:ebook/ui/init_screen.dart';
import 'package:ebook/ui/login_success/login_success_screen.dart';
import 'package:ebook/ui/otp/otp_screen.dart';
import 'package:ebook/ui/products/products_screen.dart';
import 'package:ebook/ui/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:ebook/ui/complete_profile/complete_profile_screen.dart';
import 'package:ebook/ui/cart/cart_screen.dart';



// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  //SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  //SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  //ProfileScreen.routeName: (context) => const ProfileScreen(),
};
