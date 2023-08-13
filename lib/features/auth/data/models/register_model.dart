import 'package:cook_app/features/auth/domain/entities/register/data.dart';
import 'package:cook_app/features/auth/domain/entities/register/register.dart';

class RegisterModel extends Register {
  const RegisterModel(
      {required super.data,
      required super.success,
      required super.message,
      required super.status});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        success: json['success'] as bool?,
        message: json['message'] as String?,
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'success': success,
        'message': message,
        'status': status,
      };
}
