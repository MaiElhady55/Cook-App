import 'package:cook_app/core/error/failure.dart';
import 'package:cook_app/core/usecase/base_usecase.dart';
import 'package:cook_app/features/auth/domain/entities/login/login.dart';
import 'package:cook_app/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase extends BaseUseCase<Login, LoginParameters> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters) async {
    return await baseAuthRepository.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String userNameOrEmail;
  final String password;

  const LoginParameters(
      {required this.userNameOrEmail, required this.password});

  @override
  List<Object?> get props => [userNameOrEmail, password];
}
