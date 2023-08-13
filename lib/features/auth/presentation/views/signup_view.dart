import 'package:cook_app/core/app_widgets/custom_textformfield.dart';
import 'package:cook_app/core/app_widgets/main_button.dart';
import 'package:cook_app/core/functions/navigate.dart';
import 'package:cook_app/core/functions/password_strenth.dart';
import 'package:cook_app/core/functions/show_toast.dart';
import 'package:cook_app/core/services/service_locator.dart';
import 'package:cook_app/core/utils/app_images.dart';
import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:cook_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:cook_app/features/auth/presentation/views/login_view.dart';
import 'package:cook_app/features/auth/presentation/widgets/custom_lines.dart';
import 'package:cook_app/features/auth/presentation/widgets/custom_richtext.dart';
import 'package:cook_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isButtonActive = false;
  bool isSecure = true;

  @override
  void initState() {
    emailController.addListener(() {
      passwordController.addListener(() {
        final isButtonActive = passwordController.text.isNotEmpty;
        setState(() {
          this.isButtonActive = isButtonActive;
        });
      });
    });
    nameFocusNode.addListener(() {
      setState(() {});
    });
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailFocusNode.removeListener(() {});
    passwordFocusNode.removeListener(() {});
    nameFocusNode.removeListener(() {});
    super.dispose();
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);

    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (_, current) =>
            current is RegisterSuccessState || current is RegisterFailureState,
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.register.success == true) {
              print("Message ${state.register.message}");
              showToast(
                  message: state.register.message ?? '',
                  state: ToastStates.SUCCESS);
              navigateAndFinsh(context: context, router: const LoginView());
            }
          } else if (state is RegisterFailureState) {
            print(state.errMessage);
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
                      'Hello! Create Account',
                      style: Styles.textStyle24,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomRichText(
                      text1: 'Already have an account? ',
                      text3: 'Sign in',
                      fun: () {
                        navigateTo(context: context, router: const LoginView());
                      },
                    ),
                    SizedBox(height: height * 0.049),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'User Name',
                      type: TextInputType.name,
                      focusNode: nameFocusNode,
                      textInputAction: TextInputAction.next,
                      icon: true,
                      suffix: Visibility(
                          visible: !nameFocusNode.hasFocus &&
                              nameController.text.isNotEmpty,
                          child: const Icon(
                            Icons.check_circle,
                            size: 20,
                            color: Color(0xffC1C7D0),
                          )),
                      validator: (value) {
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
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      type: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      textInputAction: TextInputAction.next,
                      icon: true,
                      suffix: Visibility(
                          visible: !emailFocusNode.hasFocus &&
                              emailController.text.isNotEmpty,
                          child: const Icon(
                            Icons.check_circle,
                            size: 20,
                            color: Color(0xffC1C7D0),
                          )),
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);

                        if (!emailValid) {
                          return 'Invalid Email Address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          current is ChangePasswordVisibilityState,
                      builder: (context, state) {
                        return CustomTextFormField(
                          controller: passwordController,
                          hintText: 'Password',
                          type: TextInputType.visiblePassword,
                          obscureText: AuthCubit.get(context).secirty,
                          textInputAction: TextInputAction.done,
                          focusNode: passwordFocusNode,
                          suffixIcon: AuthCubit.get(context).suffix,
                          /*Visibility(
                            visible: !passwordFocusNode.hasFocus &&
                                passwordController.text.isNotEmpty,
                            child: Icon(
                              AuthCubit.get(context).suffix,
                              color: const Color(0xffC1C7D0),
                              size: 20,
                            ),
                          ),*/
                          suffixFun: () {
                            AuthCubit.get(context).changePasswordVisibility();
                          },
                          validator: (value) {
                            int counter = passwordStrength(value!);
                            if (counter < 3) {
                              return 'Invalid Password';
                            }
                            if (passwordController.text.length < 8) {
                              return 'Invalid Password';
                            } else {
                              return null;
                            }
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.022),
                      child: BlocBuilder<AuthCubit, AuthState>(
                        buildWhen: (previous, current) =>
                            current is RegisterLoadingState ||
                            current is RegisterFailureState ||
                            current is RegisterSuccessState,
                        builder: (context, state) {
                          return MainButton(
                            text: 'Sign up',
                            isLoading: state is RegisterLoadingState,
                            function: isButtonActive
                                ? () async {
                                    setState(() {
                                      isButtonActive = true;
                                    });
                                    if (formKey.currentState!.validate()) {
                                      //********HTTP CODE**************/
                                      /*await BlocProvider.of<AuthCubit>(context)
                                          .signupUser(
                                              name: nameController.text,
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);*/
                                      // ignore: use_build_context_synchronously
                                      BlocProvider.of<AuthCubit>(context)
                                          .userRegister(RegisterParameters(
                                              userName: nameController.text,
                                              email: emailController.text,
                                              password:
                                                  passwordController.text));
                                    }
                                  }
                                : null,
                            width: width,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: height * 0.022,
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
