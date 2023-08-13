import 'package:equatable/equatable.dart';

import 'data.dart';

class Login extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final LoginData? data;

  const Login({this.success, this.statusCode, this.message, this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [success, statusCode, message, data];
}
