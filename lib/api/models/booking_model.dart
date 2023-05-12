class BookingModel {

  int? bookingId;
  int? flightId;

  BookingModel({ required this.bookingId, required this.flightId });

  BookingModel.fromJson(Map<String, dynamic> json){
      bookingId = json['bookingId'];
      flightId = json['flightId'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = bookingId;
    data['flightId'] = flightId;
    return data;
  }
}