/*import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final List<String>? username;
  final List<String>? email;
  final List<String>? password;

  const ErrorMessageModel({this.username, this.email, this.password});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        username: json['username'] as List<String>?,
        email: json['email'] as List<String>?,
        password: json['password'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [username, email, password];
}*/
