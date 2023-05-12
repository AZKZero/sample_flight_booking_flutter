import 'package:flutter/material.dart';
import 'package:sample_flight_management_flutter/api/models/flight_model.dart';
import 'package:sample_flight_management_flutter/ui/home/widgets/flight_item.dart';

class FlightList extends StatelessWidget {
  const FlightList({super.key, required this.flights, required this.onPressed});
  final List<FlightModel> flights;
  final Function(FlightModel flight) onPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlightItem(
            index: index,
            flight: flights[index],
            onPressed: onPressed,
          )),
      itemCount: flights.length,
    );
  }
}
