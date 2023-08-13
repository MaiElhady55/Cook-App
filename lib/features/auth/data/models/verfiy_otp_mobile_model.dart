import 'package:cook_app/features/auth/domain/entities/verify_otp_mobile/data.dart';
import 'package:cook_app/features/auth/domain/entities/verify_otp_mobile/verify_otp_mobile.dart';

class VerfiyOtpMobileModel extends VerifyOtpMobile {
  const VerfiyOtpMobileModel(
      {required super.data,
      required super.status,
      required super.message,
      required super.token});

  factory VerfiyOtpMobileModel.fromJson(Map<String, dynamic> json) {
    return VerfiyOtpMobileModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : VerifyOtpMobileData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'token': token,
        'data': data?.toJson(),
      };
}
