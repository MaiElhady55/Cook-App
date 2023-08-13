import 'package:equatable/equatable.dart';

import 'data.dart';

class Register extends Equatable {
  final Data? data;
  final bool? success;
  final String? message;
  final int? status;

  const Register(
      {required this.data,
      required this.success,
      required this.message,
      required this.status});

  @override
  List<Object?> get props => [data, success, message, status];
}
