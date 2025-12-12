class BookingModel {
  const BookingModel({
    required this.hour,
    required this.stadiumType,
    required this.datetime,
    required this.bookerName,
    required this.phoneNumber,
    required this.isLocal,
    required this.isConstant,
  });

  final String hour;
  final String stadiumType;
  final String datetime;
  final String bookerName;
  final String phoneNumber;
  final bool isLocal;
  final bool isConstant;

  Map<String, dynamic> toJson() {
    return {
      "hour": hour,
      "stadium_type": stadiumType,
      "datetime": datetime,
      "booker_name": bookerName,
      "phone_number": phoneNumber,
      "is_locale": isLocal,
      "is_constant": isConstant,
    };
  }
}
