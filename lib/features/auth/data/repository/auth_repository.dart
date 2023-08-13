import 'package:cook_app/core/error/exceptions.dart';
import 'package:cook_app/core/error/failure.dart';
import 'package:cook_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:cook_app/features/auth/domain/entities/get_otp_mobile/get_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/entities/login/login.dart';
import 'package:cook_app/features/auth/domain/entities/register/register.dart';
import 'package:cook_app/features/auth/domain/entities/verify_otp_mobile/verify_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/repository/base_auth_repository.dart';
import 'package:cook_app/features/auth/domain/usecases/get_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/verfiy_otp_mobile_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);
  @override
  Future<Either<Failure, Register>> register(
      RegisterParameters registerParameters) async {
    final result =
        await baseAuthRemoteDataSource.registerUser(registerParameters);

    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessge));
    }
  }

  @override
  Future<Either<Failure, Login>> login(LoginParameters loginParameters) async {
    final result = await baseAuthRemoteDataSource.loginUser(loginParameters);

    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessge));
    }
  }

  @override
  Future<Either<Failure, GetOtpMobile>> getOtpMobile(
      GetOtpMobileParameters getOtpMobileParameters) async {
    final result =
        await baseAuthRemoteDataSource.getOtpMobileUser(getOtpMobileParameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessge));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpMobile>> verfiyOtpMobile(
      VerfiyOtpMobileParameters verfiyOtpMobileParameters) async {
    final result = await baseAuthRemoteDataSource
        .verifyOtpMobileUser(verfiyOtpMobileParameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessge));
    }
  }
}
