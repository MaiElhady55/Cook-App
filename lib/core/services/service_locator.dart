import 'package:cook_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:cook_app/features/auth/data/repository/auth_repository.dart';
import 'package:cook_app/features/auth/domain/repository/base_auth_repository.dart';
import 'package:cook_app/features/auth/domain/usecases/get_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/verfiy_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void getInit() {
    //BloC
    getIt.registerFactory(() => AuthCubit(getIt(), getIt(), getIt(), getIt()));

    //UseCases
    getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
    getIt.registerLazySingleton(() => LoginUseCase(getIt()));
    getIt.registerLazySingleton(() => GetOtpMobileUseCase(getIt()));
    getIt.registerLazySingleton(() => VerfyOtpMobileUseCase(getIt()));

    //Repository
    getIt.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(getIt()));

    //Data Source
    getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}
