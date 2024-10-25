import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/data/api/models/user_info/user_dto.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';

part 'user_info_response_dto.g.dart';

@JsonSerializable()
class UserInfoResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;

  UserInfoResponseDto ({
    this.message,
    this.user,
  });

  factory UserInfoResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserInfoResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoResponseDtoToJson(this);
  }
}

