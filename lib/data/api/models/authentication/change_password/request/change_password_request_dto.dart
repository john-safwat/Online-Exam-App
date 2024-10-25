import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/change_password/change_password_request.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto {
  @JsonKey(name: "oldPassword")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  ChangePasswordRequestDto({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordRequestDtoFromJson(json);
  }

  factory ChangePasswordRequestDto.fromDomain(ChangePasswordRequest request) {
    return ChangePasswordRequestDto(
      oldPassword: request.oldPassword,
      password: request.password,
      rePassword: request.rePassword,
    );
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordRequestDtoToJson(this);
  }
}
