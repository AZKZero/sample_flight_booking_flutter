import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/api/models/flight_model.dart';
import 'package:sample_flight_management_flutter/api/models/token_model.dart';
import 'package:sample_flight_management_flutter/api/models/user_model.dart';
import 'package:sample_flight_management_flutter/main.dart';
import 'package:sample_flight_management_flutter/pages.dart';
import 'package:sample_flight_management_flutter/utils/extensions.dart';
import 'package:sample_flight_management_flutter/utils/logger.dart';
import 'package:sprintf/sprintf.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder

    httpClient.baseUrl = 'http://192.168.0.101:3000';
    Log.d('HTTPLOG', 'url set');
    httpClient.addResponseModifier<dynamic>((request, response) async {
      // if (kDebugMode) {
      Log.d('HTTPLOG', 'Beginning Response Log:    -->');
      Log.d('HTTPLOG', sprintf('%-25s <-- %s', ['Request Url', request.url]));
      Log.d('HTTPLOG', sprintf('%-25s <-- %s', ['Request Headers', request.headers]));
      Log.d('HTTPLOG', sprintf('%-25s <-- %s', ['Response Code', response.statusCode]));
      Log.d('HTTPLOG', sprintf('%-25s <-- %s', ['Response Body', response.bodyString]));
      Log.d('HTTPLOG', sprintf('%-25s <--', ['Ending Response Log']));
      // }
      // if (response.statusCode == 401) {
      //   Log.d('HTTPLOG', 'unauth');
      //   Get.offAndToNamed(Routes.login.page);
      // }
      return response;
    });
    httpClient.addRequestModifier<dynamic>((request) async {
      // add request here
      Log.d('HTTPLOG', request.url.toString());
      request.headers['Authorization'] = 'Bearer ${prefs.getString('token')}';

      Log.d('HTTPLOG', 'Beginning Request Log:   -->');
      Log.d('HTTPLOG', sprintf('%-25s --> %s', ['Request Url', request.url]));
      Log.d('HTTPLOG', sprintf('%-25s --> %s', ['Request Headers', request.headers]));
      Log.d('HTTPLOG', sprintf('%-25s -->', ['Ending Response Log']));
      return request;
    });
  }

  Future<Response<TokenModel>> loginUser(LoginModel model) => post(
        '/auth/login',
        model.toJson(),
        decoder: (data) => TokenModel.fromJson(data),
      );

  Future<Response<UserModel>> signupUser(SignupModel model) => post(
        '/users/signup',
        model.toJson(),
        decoder: (data) => UserModel.fromJson(data),
      );

  Future<Response<FlightResponseModel>> getFlights({
    String? airline,
    String? from,
    String? to,
    DateTime? departure,
    DateTime? arrival,
  }) =>
      get(
        '/flights',
        query: {
          'airline': airline,
          'from': from,
          'to': to,
          'departure_date': departure,
          'arrival_date': arrival,
        }.filterNotNull().nullIfEmpty(),
        decoder: (data) => FlightResponseModel.fromJson(data),
      );
}
