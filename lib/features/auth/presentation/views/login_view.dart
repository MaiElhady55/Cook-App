import 'package:cook_app/core/app_widgets/custom_textformfield.dart';
import 'package:cook_app/core/app_widgets/main_button.dart';
import 'package:cook_app/core/functions/navigate.dart';
import 'package:cook_app/core/functions/show_toast.dart';
import 'package:cook_app/core/network/local/cache_helper.dart';
import 'package:cook_app/core/services/service_locator.dart';
import 'package:cook_app/core/utils/app_images.dart';
import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:cook_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:cook_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:cook_app/features/auth/presentation/views/signup_view.dart';
import 'package:cook_app/features/auth/presentation/widgets/custom_lines.dart';
import 'package:cook_app/features/auth/presentation/widgets/custom_richtext.dart';
import 'package:cook_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController nameOrEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isButtonActive = false;
  bool isSecure = true;

  @override
  void initState() {
    nameOrEmailController.addListener(() {
      passwordController.addListener(() {
        final isButtonActive = passwordController.text.isNotEmpty;
        setState(() {
          this.isButtonActive = isButtonActive;
        });
      });
    });
    emailFocusNode.addListener(() {
      print(emailFocusNode.hasFocus.toString());
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      print(passwordFocusNode.hasFocus.toString());
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    nameOrEmailController.dispose();
    passwordController.dispose();
    emailFocusNode.removeListener(() {});
    passwordFocusNode.removeListener(() {});
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
            current is LoginSuccessState || current is LoginFailureState,
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.login.success == true) {
              print("Message ${state.login.message}");
              print('USER ID ${state.login.data?.userId}');
              showToast(
                  message: state.login.message ?? '',
                  state: ToastStates.SUCCESS);
              CacheHelper.saveDate(
                      key: 'userId', value: state.login.data?.userId)
                  .then((value) => navigateAndFinsh(
                      context: context, router: const ForgetPasswordView()));
            }
          } else if (state is RegisterFailureState) {
            showToast(message: state.errMessage, state: ToastStates.ERROR);
          }
        },
        child: Scaffold(
            body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: SizeConfig.paddingH(context),
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
                      'Welcome Back',
                      style: Styles.textStyle24,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomRichText(
                      text1: 'Hello Jos, sign in to continue!\n',
                      text2: 'Or ',
                      text3: 'Create new account',
                      fun: () {
                        navigateTo(
                            context: context, router: const SignupView());
                      },
                    ),
                    SizedBox(
                      height: height * 0.032,
                    ),
                    CustomTextFormField(
                      controller: nameOrEmailController,
                      hintText: 'Username or Email',
                      type: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      textInputAction: TextInputAction.next,
                      icon: true,
                      suffix: Visibility(
                          visible: !emailFocusNode.hasFocus &&
                              nameOrEmailController.text.isNotEmpty,
                          child: const Icon(
                            Icons.check_circle,
                            size: 20,
                            color: Color(0xffC1C7D0),
                          )),
                      validator: (value) {
                        /*bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);*/

                        //if (!value!.contains('@') || value.isEmpty) {
                        //  return 'Invalid Email Address';
                        //}
                        if (value!.isEmpty || value.length < 2) {
                          return 'Please Enter a valid Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (_, current) =>
                          current is ChangePasswordVisibilityState,
                      builder: (context, state) {
                        return CustomTextFormField(
                          controller: passwordController,
                          hintText: 'Password',
                          type: TextInputType.visiblePassword,
                          obscureText:
                              BlocProvider.of<AuthCubit>(context).secirty,
                          textInputAction: TextInputAction.done,
                          focusNode: passwordFocusNode,
                          suffixIcon:
                              BlocProvider.of<AuthCubit>(context).suffix,
                          suffixFun: () {
                            BlocProvider.of<AuthCubit>(context)
                                .changePasswordVisibility();
                          },
                          validator: (value) {
                            if (value!.length <= 6) {
                              return 'Password is too short';
                            } else {
                              return null;
                            }
                          },
                        );
                      },
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          current is LoginFailureState ||
                          current is LoginLoadingState ||
                          current is LoginSuccessState,
                      builder: (context, state) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.022),
                          child: MainButton(
                            isLoading: state is LoginLoadingState,
                            text: 'Sign in',
                            function: (nameOrEmailController.text.isNotEmpty) &&
                                    (passwordController.text.isNotEmpty)
                                ? () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<AuthCubit>(context)
                                          .userLogin(LoginParameters(
                                              userNameOrEmail:
                                                  nameOrEmailController.text,
                                              password:
                                                  passwordController.text));
                                    }
                                  }
                                : null,
                            width: width,
                          ),
                        );
                      },
                    ),
                    InkWell(
                        onTap: () {
                          navigateTo(
                              context: context,
                              router: const ForgetPasswordView());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: Styles.textStyle12,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.027,
                      ),
                      child: const CustomLines(),
                    ),
                    SocialButton(
                        fun: () {},
                        text: 'Connect with Facebook',
                        color: const Color(0xfff3f8fe),
                        imageIcon: AppImages.facebook),
                    SizedBox(
                      height: height * 0.011,
                    ),
                    SocialButton(
                        fun: () {},
                        text: 'Connect with Google',
                        color: const Color(0xffF4F5F7),
                        imageIcon: AppImages.google),
                    SizedBox(
                      height: height * 0.040,
                    ),
                  ]),
            ),
          ),
        )),
      ),
    );
  }
}
