import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/api/api_provider.dart';
import 'package:sample_flight_management_flutter/api/models/user_model.dart';
import 'package:sample_flight_management_flutter/ui/base/base_controller.dart';

import '../../main.dart';

class LoginController extends GetxController {
  final ApiProvider api = Get.find();

  final BaseController _bController = Get.find();

  // final apiLoading = false.obs;
  final apiError = false.obs;
  final Rxn<String> apiBuffer = Rxn();

  Future<void> login({required String email, required String password}) async {
    // change(null, status: RxStatus.loading());
    _bController.showLoading.value = true;
    apiBuffer.value = null;
    var response =
        await api.loginUser(LoginModel(email: email, password: password));
    _bController.showLoading.value = false;
    if (response.isOk) {
      var token = response.body?.accessToken;
      if (token != null) {
        await prefs.setString('token', token);
        apiBuffer.value = 'success';
        // change('success', status: RxStatus.success());
        // Get.offAndToNamed('/home');
      } else {
        // change(null, status: RxStatus.error());
        apiError.value = true;
        apiBuffer.value = "Malformed Response";
      }
    } else {
      apiError.value = true;
      apiBuffer.value = response.bodyString;
      // change(null, status: RxStatus.error(response.bodyString));
    }
  }
}
