import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/authentication/authentication_response.dart';

part 'authentication_response_dto.g.dart';

@JsonSerializable()
class AuthenticationResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "code")
  final num? code;

  AuthenticationResponseDto({this.message, this.token, this.code});

  factory AuthenticationResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AuthenticationResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthenticationResponseDtoToJson(this);
  }

  AuthenticationResponse toDomain() =>
      AuthenticationResponse(message: message, code: code, token: token);
}
