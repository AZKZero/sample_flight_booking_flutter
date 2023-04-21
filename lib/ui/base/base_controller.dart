import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final isLoading=false.obs;

  showLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoading.value=true;
    },);
  }

  hideLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoading.value=false;
    },);
  }
}