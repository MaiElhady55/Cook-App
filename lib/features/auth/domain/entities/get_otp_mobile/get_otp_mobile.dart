import 'package:cook_app/features/auth/domain/entities/get_otp_mobile/get_otp_mobile_data.dart';
import 'package:equatable/equatable.dart';

class GetOtpMobile extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final GetOtpMobileData? data;

  const GetOtpMobile({this.success, this.statusCode, this.message, this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [success, statusCode, message, data];
}
