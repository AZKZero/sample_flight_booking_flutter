import 'package:flutter/material.dart';
import 'package:sample_flight_management_flutter/api/models/flight_model.dart';

class FlightList extends StatelessWidget {
  const FlightList({super.key, required this.flights});
  final List<FlightModel> flights;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Item $index'),
                Text(
                  flights[index].flightName ?? '',
                  textAlign: TextAlign.start,
                ),
                Text(flights[index].flightNumber ?? '', textAlign: TextAlign.start),
                Text(flights[index].flightSource ?? '', textAlign: TextAlign.start),
                Text(flights[index].flightDestination ?? '', textAlign: TextAlign.start),
                Text(flights[index].flightTotalSeats?.toString() ?? '', textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
      ),
      itemCount: flights.length,
    );
  }
}
