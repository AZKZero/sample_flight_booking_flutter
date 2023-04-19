import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/api/models/token_model.dart';
import 'package:sample_flight_management_flutter/api/models/user_model.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder
    httpClient.baseUrl = 'http://192.168.0.101:3000';
    httpClient.addResponseModifier((request, response) async {
      print(response.body.toString());
      return response;
    });
    httpClient.addRequestModifier<dynamic>((request) async {
      // add request here
      print(request.url);
      return request;
    });
  }

  Future<Response<TokenModel>> loginUser(LoginModel model) =>
      post('/auth/login', model.toJson(), decoder: (data) => TokenModel.fromJson(data),);
}
