import 'package:get/get_navigation/src/routes/get_route.dart';

import '../V/forgot_password_screen.dart';
import '../V/main-screen.dart';
import '../V/signup_screen.dart';
import '../V/welcome_screen.dart';
import '../V/widgets/login/log_in_screen.dart';
import '../bindings/auth_binding.dart';
import '../bindings/main_binding.dart';
import '../bindings/product_binding.dart';

class AppRoutes {
//intialRoutes
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
//getPage
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPsswordScreen,
      page: () => ForgotPsswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.mainScreen, page: () => MainPage(), bindings: [
      AuthBinding(),
      MainBinding(),
      ProductBinding(),
    ]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPsswordScreen = '/forgotPsswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
