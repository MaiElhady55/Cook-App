import 'package:cook_app/core/app_widgets/main_button.dart';
import 'package:cook_app/core/constance/constance.dart';
import 'package:cook_app/core/functions/navigate.dart';
import 'package:cook_app/core/functions/show_toast.dart';
import 'package:cook_app/core/network/local/cache_helper.dart';
import 'package:cook_app/core/services/service_locator.dart';
import 'package:cook_app/core/utils/app_colors.dart';
import 'package:cook_app/core/utils/app_images.dart';
import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:cook_app/features/auth/domain/usecases/verfiy_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:cook_app/features/auth/presentation/widgets/custom_richtext.dart';
import 'package:cook_app/features/auth/presentation/widgets/pin_code.dart';
import 'package:cook_app/features/tab/presentation/views/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatefulWidget {
  final String phoneNmber;

  const OtpView(this.phoneNmber);
  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    codeController.addListener(() {
      final bool isActive = codeController.text.isNotEmpty;
      setState(() {
        isButtonActive = isActive;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (_, current) =>
            current is VerfiyOtpMobileSuccessState ||
            current is VerfiyOtpMobileFailureState,
        listener: (context, state) {
          if (state is VerfiyOtpMobileSuccessState) {
            if (state.verifyOtpMobile.status == true) {
              if (state.verifyOtpMobile.data?.isVerified == true) {
                print("Message ${state.verifyOtpMobile.message}");
                showToast(
                    message: state.verifyOtpMobile.message ?? '',
                    state: ToastStates.SUCCESS);
                CacheHelper.saveDate(
                        key: 'token', value: state.verifyOtpMobile.token)
                    .then((value) => navigateAndFinsh(
                        context: context, router: const TabView()));
              }
            }
          } else if (state is VerfiyOtpMobileFailureState) {
            showToast(message: state.errMessage, state: ToastStates.ERROR);
          }
        },
        child: Scaffold(
            body: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.077),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: height * 0.094),
                              Center(
                                  child: Image.asset(
                                AppImages.logo,
                                width: 160,
                                height: 160,
                              )),
                              SizedBox(
                                height: height * 0.065,
                              ),
                              Text(
                                'Verify phone number',
                                style: Styles.textStyle24,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'We have just sent a code to ${widget.phoneNmber}.',
                                style: Styles.textStyle14,
                              ),
                              SizedBox(
                                height: height * 0.065,
                              ),
                              PinCode(controller: codeController),
                              SizedBox(
                                height: height * 0.054,
                              ),
                              BlocBuilder<AuthCubit, AuthState>(
                                buildWhen: (previous, current) =>
                                    current is VerfiyOtpMobileFailureState ||
                                    current is VerfiyOtpMobileLoadingState ||
                                    current is VerfiyOtpMobileSuccessState,
                                builder: (context, state) {
                                  return MainButton(
                                    isLoading:
                                        state is VerfiyOtpMobileLoadingState,
                                    width: width,
                                    text: 'Next',
                                    function: isButtonActive
                                        ? () {
                                            setState(() {
                                              isButtonActive = true;
                                            });
                                            if (formKey.currentState!
                                                .validate()) {
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .verfiyOtpMobileUser(
                                                      VerfiyOtpMobileParameters(
                                                          userId: userId,
                                                          otp: codeController
                                                              .text));
                                            }
                                          }
                                        : null,
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.022),
                                child: MainButton(
                                  width: width,
                                  text: 'Send again',
                                  function: () {},
                                  buttonColor: const Color(0xffF4F5F7),
                                  textColor: AppColors.kPrimartTextColor,
                                ),
                              ),
                              CustomRichText(
                                text1: 'By signing up you agree to\n',
                                text3:
                                    'our terms of service and privacy policy.',
                                fontSize: 12,
                                fun: () {},
                              )
                            ]))))),
      ),
    );
  }
}
