import 'package:cook_app/features/auth/domain/entities/get_otp_mobile/get_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/entities/login/login.dart';
import 'package:cook_app/features/auth/domain/entities/register/register.dart';
import 'package:cook_app/features/auth/domain/entities/verify_otp_mobile/verify_otp_mobile.dart';
import 'package:cook_app/features/auth/domain/usecases/get_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/verfiy_otp_mobile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:http/http.dart' as http;
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.registerUseCase, this.loginUseCase, this.getOtpMobileUseCase,
      this.verfyOtpMobileUseCase)
      : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final GetOtpMobileUseCase getOtpMobileUseCase;
  final VerfyOtpMobileUseCase verfyOtpMobileUseCase;

  Future<void> userRegister(RegisterParameters registerParameters) async {
    emit(RegisterLoadingState());
    final result = await registerUseCase(RegisterParameters(
        userName: registerParameters.userName,
        email: registerParameters.email,
        password: registerParameters.password));

    result.fold(
        (l) => emit(RegisterFailureState(errMessage: l.message)),
        (r) => emit(
              RegisterSuccessState(register: r),
            ));
  }

  Future<void> userLogin(LoginParameters loginParameters) async {
    emit(LoginLoadingState());
    final result = await loginUseCase(LoginParameters(
        userNameOrEmail: loginParameters.userNameOrEmail,
        password: loginParameters.password));

    result.fold(
        (l) => emit(LoginFailureState(errMessage: l.message)),
        (r) => emit(
              LoginSuccessState(login: r),
            ));
  }

  Future<void> getOtpMobileUser(
      GetOtpMobileParameters getOtpMobileParameters) async {
    emit(GetOtpMobileLoadingState());
    final result = await getOtpMobileUseCase(GetOtpMobileParameters(
        userId: getOtpMobileParameters.userId,
        mobile: getOtpMobileParameters.mobile));

    result.fold(
        (l) => emit(GetOtpMobileFailureState(errMessage: l.message)),
        (r) => emit(
              GetOtpMobileSuccessState(getOtpMobile: r),
            ));
  }

  Future<void> verfiyOtpMobileUser(
      VerfiyOtpMobileParameters verfiyOtpMobileParameters) async {
    emit(VerfiyOtpMobileLoadingState());
    final result = await verfyOtpMobileUseCase(VerfiyOtpMobileParameters(
        userId: verfiyOtpMobileParameters.userId,
        otp: verfiyOtpMobileParameters.otp));

    result.fold(
        (l) => emit(VerfiyOtpMobileFailureState(errMessage: l.message)),
        (r) => emit(
              VerfiyOtpMobileSuccessState(verifyOtpMobile: r),
            ));
  }

  IconData suffix = Icons.visibility;
  bool secirty = true;
  void changePasswordVisibility() {
    secirty = !secirty;
    suffix = secirty ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }

//**********************HTTP CODE USING *************************** */
  /*Future<void> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    const String url =
        'https://shadyelnady2020.pythonanywhere.com/api/register/';
    try {
      final response = await http.post(Uri.parse(url),
          body: json
              .encode({"username": name, "email": email, "password": password}),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201) {
        print(response.body.toString());
        RegisterModel registerModel =
            RegisterModel.fromJson(jsonDecode(response.body));
        emit(RegisterSuccessState(register: registerModel));
        print(' Message ${registerModel.message}');
      }
    } catch (e) {
      emit(RegisterFailureState(errMessage: e.toString()));
      print('MMEESAGE ${e.toString()}');
    }
  }*/
}
