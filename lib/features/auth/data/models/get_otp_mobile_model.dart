import 'package:cook_app/features/auth/domain/entities/get_otp_mobile/get_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/entities/get_otp_mobile/get_otp_mobile_data.dart';

class GetOtpMobileModel extends GetOtpMobile {
  const GetOtpMobileModel(
      {required super.data,
      required super.success,
      required super.message,
      required super.statusCode});

  factory GetOtpMobileModel.fromJson(Map<String, dynamic> json) =>
      GetOtpMobileModel(
        success: json['success'] as bool?,
        statusCode: json['status code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : GetOtpMobileData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'status code': statusCode,
        'message': message,
        'data': data?.toJson(),
      };
}
