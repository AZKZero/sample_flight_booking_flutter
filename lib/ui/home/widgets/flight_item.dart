import 'package:flutter/material.dart';
import 'package:sample_flight_management_flutter/api/models/flight_model.dart';

class FlightItem extends StatelessWidget {
  const FlightItem({super.key, required this.index, required this.flight, required this.onPressed});

  final int index;
  final FlightModel flight;
  final Function(FlightModel flight) onPressed;

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Item $index'),
              Text(
                flight.flightName ?? '',
                textAlign: TextAlign.start,
              ),
              Text(flight.flightNumber ?? '', textAlign: TextAlign.start),
              Text(flight.flightSource ?? '', textAlign: TextAlign.start),
              Text(flight.flightDestination ?? '', textAlign: TextAlign.start),
              Text(flight.flightTotalSeats?.toString() ?? '', textAlign: TextAlign.start),
              ElevatedButton(
                onPressed: onPressed(flight),
                child: const Text('Book Flight'),
              ),
            ],
          ),
        ),
      );
}
