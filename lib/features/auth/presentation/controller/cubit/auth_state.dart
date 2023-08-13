part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class ChangePasswordVisibilityState extends AuthState {}

//**********************Register************************ */

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final Register register;

  const RegisterSuccessState({required this.register});
  @override
  List<Object> get props => [register];
}

class RegisterFailureState extends AuthState {
  final String errMessage;

  const RegisterFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//**************************LOGIN ***************************************

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final Login login;

  const LoginSuccessState({required this.login});
  @override
  List<Object> get props => [login];
}

class LoginFailureState extends AuthState {
  final String errMessage;

  const LoginFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//**************************Get Otp Mobile ***************************************

class GetOtpMobileLoadingState extends AuthState {}

class GetOtpMobileSuccessState extends AuthState {
  final GetOtpMobile getOtpMobile;

  const GetOtpMobileSuccessState({required this.getOtpMobile});
  @override
  List<Object> get props => [getOtpMobile];
}

class GetOtpMobileFailureState extends AuthState {
  final String errMessage;

  const GetOtpMobileFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//**************************Verfiy Otp Mobile ***************************************

class VerfiyOtpMobileLoadingState extends AuthState {}

class VerfiyOtpMobileSuccessState extends AuthState {
  final VerifyOtpMobile verifyOtpMobile;

  const VerfiyOtpMobileSuccessState({required this.verifyOtpMobile});
  @override
  List<Object> get props => [verifyOtpMobile];
}

class VerfiyOtpMobileFailureState extends AuthState {
  final String errMessage;

  const VerfiyOtpMobileFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
