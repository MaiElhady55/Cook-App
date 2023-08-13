import 'package:cook_app/core/error/failure.dart';
import 'package:cook_app/core/usecase/base_usecase.dart';
import 'package:cook_app/features/auth/domain/entities/register/register.dart';
import 'package:cook_app/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUseCase extends BaseUseCase<Register, RegisterParameters> {
  final BaseAuthRepository baseAuthRepository;
  RegisterUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, Register>> call(RegisterParameters parameters) async {
    return await baseAuthRepository.register(parameters);
  }

  /*Future<Either<Failure, Register>> registerUseCase(
      RegisterParameters registerParameters) async {
    return await baseAuthRepository.register(registerParameters);
  }*/
}

class RegisterParameters extends Equatable {
  final String userName;
  final String email;
  final String password;

  const RegisterParameters(
      {required this.userName, required this.email, required this.password});

  @override
  List<Object?> get props => [userName, email, password];
}
