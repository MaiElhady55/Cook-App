import 'package:cook_app/core/app_widgets/custom_textformfield.dart';
import 'package:cook_app/core/app_widgets/main_button.dart';
import 'package:cook_app/core/functions/password_strenth.dart';
import 'package:cook_app/core/utils/app_images.dart';
import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:cook_app/features/auth/presentation/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController newPasswordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode newPassFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();

  bool isNewSecure = true;
  bool isConfirmSecure = true;
  bool isButtonActive = false;
  int counter = 0;

  @override
  void initState() {
    newPasswordController.addListener(() {
      confirmPasswordController.addListener(() {
        final isButtonActive = confirmPasswordController.text.isNotEmpty;
        setState(() {
          this.isButtonActive = isButtonActive;
        });
      });
    });
    newPassFocusNode.addListener(() {
      print(newPassFocusNode.hasFocus.toString());
      setState(() {});
    });
    confirmPassFocusNode.addListener(() {
      print(confirmPassFocusNode.hasFocus.toString());
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    newPassFocusNode.removeListener(() {});
    confirmPassFocusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.077),
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
                            'Reset your password',
                            style: Styles.textStyle24,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const CustomRichText(
                              text1:
                                  'At least 8 characters including uppercase and \n lowercase letters'),
                          SizedBox(height: height * 0.032),
                          CustomTextFormField(
                            controller: newPasswordController,
                            hintText: 'New Password',
                            type: TextInputType.visiblePassword,
                            obscureText: isNewSecure,
                            textInputAction: TextInputAction.next,
                            focusNode: newPassFocusNode,
                            icon: true,
                            suffix: Visibility(
                              visible: !newPassFocusNode.hasFocus &&
                                  newPasswordController.text.isNotEmpty,
                              child: Icon(
                                isNewSecure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xffC1C7D0),
                                size: 20,
                              ),
                            ),
                            suffixFun: () {
                              setState(() {
                                isNewSecure = !isNewSecure;
                              });
                            },
                            validator: (value) {
                              int counter = passwordStrength(value!);
                              if (counter < 3) {
                                return 'Invalid Password';
                              }
                              if (newPasswordController.text.length < 8) {
                                return 'Invalid Password';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextFormField(
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            hintText: 'Confirm Password',
                            focusNode: confirmPassFocusNode,
                            obscureText: isConfirmSecure,
                            textInputAction: TextInputAction.done,
                            icon: true,
                            suffix: Visibility(
                              visible: !confirmPassFocusNode.hasFocus &&
                                  confirmPasswordController.text.isNotEmpty,
                              child: Icon(
                                isConfirmSecure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xffC1C7D0),
                                size: 20,
                              ),
                            ),
                            suffixFun: () {
                              setState(() {
                                isConfirmSecure = !isConfirmSecure;
                              });
                            },
                            validator: (value) {
                              if (value != newPasswordController.text) {
                                return 'Password dose not match';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.022,
                          ),
                          MainButton(
                              width: width,
                              text: 'Update',
                              function: (newPasswordController
                                          .text.isNotEmpty &&
                                      confirmPasswordController.text.isNotEmpty)
                                  ? () {
                                      /*setState(() {
                                        isButtonActive = true;
                                      });*/
                                      if (formKey.currentState!.validate()) {
                                        print('success');
                                      }
                                    }
                                  : null)
                        ])))));
  }
}
