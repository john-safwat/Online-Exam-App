import 'package:json_annotation/json_annotation.dart';

part 'registration_user_dto.g.dart'; // Add this line

@JsonSerializable()
class RegistrationUserDto {
  RegistrationUserDto(
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  );

  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;

  // The factory constructor for deserialization
  factory RegistrationUserDto.fromJson(Map<String, dynamic> json) =>
      _$RegistrationUserDtoFromJson(json); // Add this line

  // The toJson method for serialization
  Map<String, dynamic> toJson() => _$RegistrationUserDtoToJson(this);
}
