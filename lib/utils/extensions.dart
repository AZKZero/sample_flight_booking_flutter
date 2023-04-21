import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:sample_flight_management_flutter/pages.dart';

import '../ui/dialogs/dialog_wrapper.dart';

extension MapUtils<K, V> on Map<K, V> {
  Map<K, V> filterNotNull() => this..removeWhere((key, value) => value == null);
  Map<K, V>? nullIfEmpty() => length > 0 ? this : null;
}

extension ResponseUtils on Response {
  void handleIfError() {
    if (hasError) {
      if (statusCode == 401) {
        Get.offAndToNamed(Routes.login.page);
      } else {
        Get.dialog(
            DialogWrapper(
              title: 'Error',
              message: bodyString,
            ),
            barrierDismissible: true,
            useSafeArea: true);
      }
    }
  }
}
