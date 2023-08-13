import 'package:cook_app/features/auth/domain/entities/login/data.dart';
import 'package:cook_app/features/auth/domain/entities/login/login.dart';

class LoginModel extends Login {
  const LoginModel(
      {required super.data,
      required super.success,
      required super.message,
      required super.statusCode});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json['success'] as bool?,
        statusCode: json['status code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'status code': statusCode,
        'message': message,
        'data': data?.toJson(),
      };
}
