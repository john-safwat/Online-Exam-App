import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/authentication/verify_reset_code/verify_reset_code_request.dart';

part 'verify_reset_code_request_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyResetCodeRequestDto ({
    this.resetCode,
  });

  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeRequestDtoToJson(this);
  }

  // factory ForgetPasswordRequestDto.fromDomain(ForgetPasswordRequest request) =>
  //     ForgetPasswordRequestDto(email: request.email);

  factory VerifyResetCodeRequestDto.fromDomain(VerifyResetCodeRequest request) =>
      VerifyResetCodeRequestDto(resetCode: request.resetCode);
}


