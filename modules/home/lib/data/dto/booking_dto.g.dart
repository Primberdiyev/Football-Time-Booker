// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDto _$BookingDtoFromJson(Map<String, dynamic> json) => BookingDto(
      hour: json['hour'] as String?,
      stadiumType: json['stadium_type'] as String?,
      datetime: json['datetime'] as String?,
      bookerName: json['booker_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isLocal: json['is_local'] as bool?,
      isConstant: json['is_constant'] as bool?,
    );

Map<String, dynamic> _$BookingDtoToJson(BookingDto instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'stadium_type': instance.stadiumType,
      'datetime': instance.datetime,
      'booker_name': instance.bookerName,
      'phone_number': instance.phoneNumber,
      'is_local': instance.isLocal,
      'is_constant': instance.isConstant,
    };
