import 'package:cook_app/core/error/failure.dart';
import 'package:cook_app/core/usecase/base_usecase.dart';
import 'package:cook_app/features/auth/domain/entities/get_otp_mobile/get_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetOtpMobileUseCase
    extends BaseUseCase<GetOtpMobile, GetOtpMobileParameters> {
  final BaseAuthRepository baseAuthRepository;

  GetOtpMobileUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, GetOtpMobile>> call(
      GetOtpMobileParameters parameters) async {
    return await baseAuthRepository.getOtpMobile(parameters);
  }
}

class GetOtpMobileParameters extends Equatable {
  final String userId;
  final String mobile;

  const GetOtpMobileParameters({required this.userId, required this.mobile});

  @override
  List<Object?> get props => [userId, mobile];
}
