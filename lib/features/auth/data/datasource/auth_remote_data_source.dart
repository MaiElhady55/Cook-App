import 'package:cook_app/core/error/exceptions.dart';
import 'package:cook_app/core/network/remote/api_constance.dart';
import 'package:cook_app/core/network/remote/dio_helper.dart';
import 'package:cook_app/core/network/remote/error_message_model.dart';
import 'package:cook_app/features/auth/data/models/get_otp_mobile_model.dart';
import 'package:cook_app/features/auth/data/models/login_model.dart';
import 'package:cook_app/features/auth/data/models/register_model.dart';
import 'package:cook_app/features/auth/data/models/verfiy_otp_mobile_model.dart';
import 'package:cook_app/features/auth/domain/usecases/get_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/features/auth/domain/usecases/verfiy_otp_mobile_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseAuthRemoteDataSource {
  Future<RegisterModel> registerUser(RegisterParameters registerParameters);
  Future<LoginModel> loginUser(LoginParameters loginParameters);
  Future<GetOtpMobileModel> getOtpMobileUser(
      GetOtpMobileParameters getOtpMobileParameters);
  Future<VerfiyOtpMobileModel> verifyOtpMobileUser(
      VerfiyOtpMobileParameters verfiyOtpMobileParameters);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<RegisterModel> registerUser(
      RegisterParameters registerParameters) async {
    Response response =
        await DioHelper.postData(endPoint: ApiConstance.register, data: {
      "username": registerParameters.userName,
      "email": registerParameters.email,
      "password": registerParameters.password
    });
    //*******************HTTP CODE********************** */
    /* final response =
        await DioHelper.sendData(endPoint: ApiConstance.register, data: {
      "username": registerParameters.userName,
      "email": registerParameters.email,
      "password": registerParameters.password
    });*/
    if (response.statusCode == 201) {
      return RegisterModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<LoginModel> loginUser(LoginParameters loginParameters) async {
    final Response response =
        await DioHelper.postData(endPoint: ApiConstance.login, data: {
      'username_or_email': loginParameters.userNameOrEmail,
      'password': loginParameters.password
    });
    if (response.statusCode == 200) {
      print('COOD${response.statusCode}');
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<GetOtpMobileModel> getOtpMobileUser(
      GetOtpMobileParameters getOtpMobileParameters) async {
    Response response =
        await DioHelper.postData(endPoint: ApiConstance.getOtpMobile, data: {
      'mobile': getOtpMobileParameters.mobile,
      'user_id': getOtpMobileParameters.userId
    });

    if (response.statusCode == 202) {
      return GetOtpMobileModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<VerfiyOtpMobileModel> verifyOtpMobileUser(
      VerfiyOtpMobileParameters verfiyOtpMobileParameters) async {
    Response response =
        await DioHelper.postData(endPoint: ApiConstance.verifyOtpMobile, data: {
      'otp': verfiyOtpMobileParameters.otp,
      'user_id': verfiyOtpMobileParameters.userId
    });
    if (response.statusCode == 200) {
      return VerfiyOtpMobileModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
