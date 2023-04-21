import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/ui/base/base_controller.dart';

class BaseView extends GetView<BaseController> {
  final Widget? child;
  const BaseView({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: child!),
          Obx(() => controller.isLoading.value
              ? Positioned.fill(
                  child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.blueGrey.shade200.withOpacity(0.5))
                  ]),
                  child: const Center(child: CircularProgressIndicator()),
                ))
              : Container())
        ],
      ),
    );
  }
}
