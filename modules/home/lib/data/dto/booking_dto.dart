import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class BookingDto {
  const BookingDto({
    this.hour,
    this.stadiumType,
    this.datetime,
    this.bookerName,
    this.phoneNumber,
    this.isLocal,
    this.isConstant,
  });
  factory BookingDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDtoFromJson(json);
  final String? hour;
  final String? stadiumType;
  final String? datetime;
  final String? bookerName;
  final String? phoneNumber;
  final bool? isLocal;
  final bool? isConstant;

  Map<String, dynamic> toJson() => _$BookingDtoToJson(this);
}
