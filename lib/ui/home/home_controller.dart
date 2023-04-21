import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/api/models/flight_model.dart';
import 'package:sample_flight_management_flutter/pages.dart';
import 'package:sample_flight_management_flutter/ui/dialogs/dialog_wrapper.dart';

import '../../api/api_provider.dart';
import '../base/base_controller.dart';

class HomeController extends GetxController {
  final ApiProvider api = Get.find();

  final BaseController _bController = Get.find();

  // final apiLoading = false.obs;
  final apiError = false.obs;
  final Rxn<FlightResponseModel> apiBuffer = Rxn();

  Future<void> getFlights({String? from, String? to}) async {
    apiError.value = false;
    _bController.showLoading();
    print(api.httpClient.baseUrl);
    var response = await api.getFlights(from: from, to: to);
    print(response);
    _bController.hideLoading();
    if (response.isOk) {
      var flights = response.body;
      if (flights != null) {
        apiBuffer.value = flights;
      }
    } else if (response.statusCode == 401) {
      Get.offAndToNamed(Routes.login.page);
    } else {
      apiError.value = true;
      Get.dialog(
          DialogWrapper(
            title: 'Error',
            message: response.bodyString,
          ),
          barrierDismissible: true,
          useSafeArea: true);
    }
  }
}
