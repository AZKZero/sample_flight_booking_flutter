import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/ui/login/login_controller.dart';
import 'package:sample_flight_management_flutter/ui/login/login_screen.dart';

enum Routes {
  home(page: '/home'),
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
      }))
];
