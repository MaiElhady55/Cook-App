import 'package:cook_app/core/error/failure.dart';
import 'package:cook_app/core/usecase/base_usecase.dart';
import 'package:cook_app/features/auth/domain/entities/verify_otp_mobile/verify_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerfyOtpMobileUseCase
    extends BaseUseCase<VerifyOtpMobile, VerfiyOtpMobileParameters> {
  final BaseAuthRepository baseAuthRepository;

  VerfyOtpMobileUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, VerifyOtpMobile>> call(
      VerfiyOtpMobileParameters parameters) async {
    return await baseAuthRepository.verfiyOtpMobile(parameters);
  }
}

class VerfiyOtpMobileParameters extends Equatable {
  final String userId;
  final String otp;

  const VerfiyOtpMobileParameters({required this.userId, required this.otp});

  @override
  List<Object?> get props => [userId, otp];
}
