import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/ui/home/home_controller.dart';
import 'package:sample_flight_management_flutter/ui/home/home_screen.dart';
import 'package:sample_flight_management_flutter/ui/login/login_controller.dart';
import 'package:sample_flight_management_flutter/ui/login/login_screen.dart';
import 'package:sample_flight_management_flutter/ui/signup/signup_controller.dart';
import 'package:sample_flight_management_flutter/ui/signup/signup_screen.dart';

enum Routes {
  home(page: '/home'),
  signup(page: '/signup'),
  login(page: '/login'),
  splash(page: '/');

  const Routes({required this.page});

  final String page;
}

final pages = [
  GetPage(
      name: Routes.login.page,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      })),
  GetPage(
      name: Routes.home.page,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      })),
  GetPage(
      name: Routes.signup.page,
      page: () => SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignupController());
      }))
];
