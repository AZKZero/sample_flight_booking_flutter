import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/api/models/booking_model.dart';
import 'package:sample_flight_management_flutter/api/models/flight_model.dart';
import 'package:sample_flight_management_flutter/pages.dart';
import 'package:sample_flight_management_flutter/ui/dialogs/dialog_wrapper.dart';
import 'package:sample_flight_management_flutter/utils/extensions.dart';
import 'package:sample_flight_management_flutter/utils/logger.dart';

import '../../api/api_provider.dart';
import '../base/base_controller.dart';

class HomeController extends GetxController {
  final ApiProvider api = Get.find();

  final BaseController _bController = Get.find();

  // final apiLoading = false.obs;
  final apiError = false.obs;
  final Rxn<FlightResponseModel> flightList = Rxn();

  Future<void> getFlights({String? from, String? to}) async {
    apiError.value = false;
    _bController.showLoading();
    Log.d('HomeController', api.httpClient.baseUrl);
    var response = await api.getFlights(from: from, to: to);
    Log.d('HomeController', response.bodyString);
    _bController.hideLoading();
    if (response.isOk) {
      var flights = response.body;
      if (flights != null) {
        flightList.value = flights;
      }
    } else {
      response.handleIfError();
    }
  }

  final Rxn<BookingModel> booking = Rxn();
  Future<void> bookFlight({required int flightId}) async {
    apiError.value = false;
    _bController.showLoading();
    Log.d('HomeController', api.httpClient.baseUrl);
    var response = await api.createBooking(flightId: flightId);
    Log.d('HomeController', response.bodyString);
    _bController.hideLoading();
    if (response.isOk) {
      var booking = response.body;
      if (booking != null) {
        this.booking.value = booking;
      }
    } else {
      response.handleIfError();
    }
  }
}
