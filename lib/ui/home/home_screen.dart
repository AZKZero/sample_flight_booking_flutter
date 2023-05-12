import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/ui/home/home_controller.dart';
import 'package:sample_flight_management_flutter/ui/home/widgets/flight_list.dart';
import 'package:sample_flight_management_flutter/ui/home/widgets/flights_filter.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key}) {
    controller.getFlights();
  }
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(children: [
        FlightsFilter(formKey: _formKey),
        ElevatedButton(
            onPressed: () {
              _formKey.currentState?.save();
              controller.getFlights(from: _formKey.currentState?.value['from'], to: _formKey.currentState?.value['to']);
            },
            child: const Text('Search')),
        Expanded(
          child: Obx(() => FlightList(
                flights: controller.flightList.value?.flights ?? [],
                onPressed: (flight) {},
              )),
        )
      ]),
    );
  }
}
