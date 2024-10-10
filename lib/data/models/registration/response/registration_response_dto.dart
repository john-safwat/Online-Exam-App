import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/registration/registration_response.dart';

part 'registration_response_dto.g.dart';

@JsonSerializable()
class RegistrationResponseDto {
  RegistrationResponseDto({this.message, this.token, this.code});

  factory RegistrationResponseDto.fromJson(dynamic json) =>
      _$RegistrationResponseDtoFromJson(json);

  String? message;
  String? token;
  num? code;

  Map<String, dynamic> toJson() => _$RegistrationResponseDtoToJson(this);

  RegistrationResponse toDomain() {
    return RegistrationResponse(message: message, token: token, code: code);
  }
}
