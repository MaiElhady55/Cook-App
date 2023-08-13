import 'package:cook_app/core/error/failure.dart';
import 'package:cook_app/features/auth/domain/entities/get_otp_mobile/get_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/entities/login/login.dart';
import 'package:cook_app/features/auth/domain/entities/register/register.dart';
import 'package:cook_app/features/auth/domain/entities/verify_otp_mobile/verify_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/usecases/get_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/verfiy_otp_mobile_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Register>> register(
      RegisterParameters registerParameters);

  Future<Either<Failure, Login>> login(LoginParameters loginParameters);

  Future<Either<Failure, GetOtpMobile>> getOtpMobile(
      GetOtpMobileParameters getOtpMobileParameters);

  Future<Either<Failure, VerifyOtpMobile>> verfiyOtpMobile(
      VerfiyOtpMobileParameters verfiyOtpMobileParameters);
}
