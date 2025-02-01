import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? status;
  String? message;
  Data? data;


  LoginResponse({this.status, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class Data{
  String? access_token;
  String? token_type;
  User? user;

  Data({this.access_token, this.token_type, this.user});

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}

@JsonSerializable()
class User{
  String? name;
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  int? type;
  int? status;
  String? profile_image;
  List? permissions;

  User({
    this.name, this.email, this.phone,
    this.type, this.status, this.profile_image,this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}