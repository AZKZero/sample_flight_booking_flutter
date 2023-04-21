import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/ui/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key}) {
    controller.getFlights();
  }
  final List<String> locations = ['All', 'Dhaka', 'Essen', 'Chittagong'];
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Column(children: [
        FormBuilder(
          key: _formKey,
          child: Row(
            children: <Widget>[
              Expanded(
                child: FormBuilderDropdown(
                  items: [
                    const DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: null,
                      child: Text('All'),
                    ),
                    ...locations
                        .map((location) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: location,
                              child: Text(location),
                            ))
                        .toList()
                  ],
                  name: 'from',
                ),
              ),
              Expanded(
                child: FormBuilderDropdown(
                  items: [
                    const DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: null,
                      child: Text('All'),
                    ),
                    ...locations
                        .map((location) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: location,
                              child: Text(location),
                            ))
                        .toList()
                  ],
                  name: 'to',
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () => controller.getFlights(from: _formKey.currentState?.value['from'], to: _formKey.currentState?.value['to']),
            child: const Text('Search')),
        // ListView.builder(itemBuilder: (context, index) => ,itemCount: ,)
        Expanded(
          child: Obx(() => ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Item $index'),
                          Text(controller.apiBuffer.value?.flights?[index].flightName ?? ''),
                          Text(controller.apiBuffer.value?.flights?[index].flightNumber ?? ''),
                          Text(controller.apiBuffer.value?.flights?[index].flightSource ?? ''),
                          Text(controller.apiBuffer.value?.flights?[index].flightDestination ?? ''),
                          Text(controller.apiBuffer.value?.flights?[index].flightTotalSeats?.toString() ?? ''),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: controller.apiBuffer.value?.flights?.length ?? 0,
              )),
        )
      ]),
    );
  }
}
