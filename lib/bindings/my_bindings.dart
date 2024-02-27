import 'package:ebook/controllers/LoginController.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(UserService());
    //Get.put(ThemeController());
    //Get.put(SplashController());
    //Get.lazyPut<SplashController>(() => SplashController());
    Get.put(LoginController());
    //Get.put(UserController());
    //Get.put(ThemeController());
    //Get.put(LanguageController());
    //Get.lazyPut<LoginController>(() => LoginController());
    //Get.lazyPut<UserController>(() => UserController());
    //Get.put(MyController());
    //Get.lazyPut<UserService>(() => UserService());
  }
}
