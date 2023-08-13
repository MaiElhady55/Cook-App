import 'package:equatable/equatable.dart';

import 'data.dart';

class VerifyOtpMobile extends Equatable {
  final bool? status;
  final String? message;
  final String? token;
  final VerifyOtpMobileData? data;

  const VerifyOtpMobile({this.status, this.message, this.token, this.data});

  @override
  List<Object?> get props => [status, message, token, data];
}
