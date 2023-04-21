import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/api/api_provider.dart';
import 'package:sample_flight_management_flutter/api/models/user_model.dart';
import 'package:sample_flight_management_flutter/pages.dart';
import 'package:sample_flight_management_flutter/ui/base/base_controller.dart';

class SignupController extends GetxController {
  final ApiProvider api = Get.find();

  final BaseController _bController = Get.find();

  // final apiLoading = false.obs;
  final apiError = false.obs;
  final Rxn<String> apiBuffer = Rxn();

  signup({required String email, required String password, required String name}) async {
    _bController.showLoading();
    apiBuffer.value = null;
    var response = await api.signupUser(SignupModel(email: email, password: password, name: name));
    _bController.hideLoading();
    if (response.isOk) {
      var user = response.body;
      if (user != null) {
        Get.offAndToNamed(Routes.login.page);
      } else {
        apiError.value = true;
        apiBuffer.value = "Malformed Response";
      }
    } else {
      apiError.value = true;
      apiBuffer.value = response.bodyString;
    }
  }
}
