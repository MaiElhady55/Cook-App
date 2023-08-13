import 'package:cook_app/core/app_widgets/main_button.dart';
import 'package:cook_app/core/constance/constance.dart';
import 'package:cook_app/core/functions/navigate.dart';
import 'package:cook_app/core/functions/show_toast.dart';
import 'package:cook_app/core/services/service_locator.dart';
import 'package:cook_app/core/utils/app_images.dart';
import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:cook_app/features/auth/domain/usecases/get_otp_mobile_usecase.dart';
import 'package:cook_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:cook_app/features/auth/presentation/views/otp_view.dart';
import 'package:cook_app/features/auth/presentation/widgets/custom_intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneCodeController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    phoneCodeController.addListener(() {
      final bool isActive = phoneCodeController.text.isNotEmpty;
      setState(() {
        isButtonActive = isActive;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    phoneCodeController.dispose();
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
            current is GetOtpMobileSuccessState ||
            current is GetOtpMobileFailureState,
        listener: (context, state) {
          if (state is GetOtpMobileSuccessState) {
            if (state.getOtpMobile.success == true) {
              print("Message ${state.getOtpMobile.message}");
              showToast(
                  message: state.getOtpMobile.message ?? '',
                  state: ToastStates.SUCCESS);
              navigateAndFinsh(
                  context: context, router: OtpView(phoneCodeController.text));
            }
          } else if (state is GetOtpMobileFailureState) {
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
                                'Get started with Cook',
                                style: Styles.textStyle24,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Enter your phone number',
                                style: Styles.textStyle14,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.032),
                                child: CustomIntlPhoneField(
                                    phoneCodeController: phoneCodeController),
                              ),
                              BlocBuilder<AuthCubit, AuthState>(
                                buildWhen: (previous, current) =>
                                    current is GetOtpMobileFailureState ||
                                    current is GetOtpMobileLoadingState ||
                                    current is GetOtpMobileSuccessState,
                                builder: (context, state) {
                                  return MainButton(
                                    isLoading:
                                        state is GetOtpMobileLoadingState,
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
                                                  .getOtpMobileUser(
                                                      GetOtpMobileParameters(
                                                          userId: userId,
                                                          mobile:
                                                              phoneCodeController
                                                                  .text));
                                            }
                                          }
                                        : null,
                                    width: width,
                                  );
                                },
                              ),
                            ]))))),
      ),
    );
  }
}
