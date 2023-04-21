import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/pages.dart';
import 'package:sample_flight_management_flutter/ui/base/base_controller.dart';
import 'package:sample_flight_management_flutter/ui/base/base_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_provider.dart';

late final SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  // Get.put<ApiProvider>(
  //   ApiProvider(),
  //   permanent: true,
  // );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.home.page,
    theme: ThemeData.light(useMaterial3: false),
    defaultTransition: Transition.fade,
    initialBinding: BindingsBuilder(() {
      Get.put(ApiProvider());
      Get.put(BaseController());
    }),
    // onInit: () {

    // },
    getPages: pages,
    // home: SplashPage(),
    builder: (context, child) => BaseView(child: child),
  ));
}
