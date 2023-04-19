import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/api/api_provider.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProvider());
  }
  
}