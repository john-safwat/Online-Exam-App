import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/edit_user_info_request/edit_user_info_request.dart';

part 'edit_user_info_request_dto.g.dart';

@JsonSerializable()
class EditUserInfoRequestDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;

  EditUserInfoRequestDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory EditUserInfoRequestDto.fromJson(Map<String, dynamic> json) {
    return _$EditUserInfoRequestDtoFromJson(json);
  }

  factory EditUserInfoRequestDto.fromDomain(EditUserInfoRequest user) {
    return EditUserInfoRequestDto(
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      phone: user.phone,
    );
  }

  Map<String, dynamic> toJson() {
    return _$EditUserInfoRequestDtoToJson(this);
  }
}
