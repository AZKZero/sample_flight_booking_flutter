class FlightModel {
  int? flightId;
  String? flightName;
  String? flightNumber;
  DateTime? flightArrivalTime;
  DateTime? flightDepartureTime;
  String? flightSource;
  String? flightDestination;
  int? flightTotalSeats;
  int? airlineId;

  FlightModel({
    required flightId,
    required flightName,
    required flightNumber,
    required flightArrivalTime,
    required flightDepartureTime,
    required flightSource,
    required flightDestination,
    required flightTotalSeats,
    required airlineId,
  });

  FlightModel.fromJson(Map<String, dynamic> json) {
    flightId = json['flightId'];
    flightName = json['flightName'];
    flightNumber = json['flightNumber'];
    flightArrivalTime = DateTime.parse(json['flightArrivalTime']);
    flightDepartureTime = DateTime.parse(json['flightDepartureTime']);
    flightSource = json['flightSource'];
    flightDestination = json['flightDestination'];
    flightTotalSeats = json['flightTotalSeats'];
    airlineId = json['airlineId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['flight_id'] = flightId;
    json['flight_name'] = flightName;
    json['flight_plane_number'] = flightNumber;
    json['flight_arrival_time'] = flightArrivalTime;
    json['flight_departure_time'] = flightDepartureTime;
    json['flight_source'] = flightSource;
    json['flight_destination'] = flightDestination;
    json['flight_total_seats'] = flightTotalSeats;
    json['airline_id'] = airlineId;
    return json;
  }
}

class FlightResponseModel {

  List<FlightModel>? flights;

  FlightResponseModel({ this.flights });

  FlightResponseModel.fromJson(Map<String, dynamic> json){
      flights=(json['flights'] as List<dynamic>).map((item) => FlightModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flights'] = flights;
    return data;
  }
}