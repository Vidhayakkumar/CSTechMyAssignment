import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/providers/auth_provider.dart';
import 'package:my_assign/providers/userDatatProvider.dart';
import 'package:my_assign/res/app_colors.dart';
import 'package:my_assign/res/utils.dart';
import 'package:my_assign/routes/app_.routes.dart';
import 'package:my_assign/widgets/text/custom_big_texf.dart';
import 'package:my_assign/widgets/text/custom_rich_text.dart';
import 'package:my_assign/widgets/button/custom_rounded_button.dart';
import 'package:my_assign/widgets/text/custom_small_text.dart';
import 'package:my_assign/widgets/text/double_text.dart';
import 'package:my_assign/widgets/textField/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../providers/checkbox_providers.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController wpPhoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    wpPhoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkBoxProvider = Provider.of<CheckboxProvider>(
      context,
      listen: false,
    );
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Image.asset('assets/images/Logo.png', height: 60.h),
              SizedBox(height: 30.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                    top: 20.w,
                    bottom: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomBigText(text: 'Welcome!', fontSize: 30.sp),
                      CustomSmallText(
                        text: 'Please register to continue',
                        fontSize: 15.sp,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Name',
                        suffixImage: 'assets/images/person.png',
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email address',
                        suffixImage: 'assets/images/email.png',
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        suffixImage: 'assets/images/password.png',
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        controller: wpPhoneController,
                        hintText: '+91',
                        prefixImage: 'assets/images/india_logo.png',
                        suffixImage: 'assets/images/whatsApp.png',
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Mobile number',
                        suffixImage: 'assets/images/phone.png',
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xFFAAAAAA),
                            checkColor: AppColors.btnColor,
                            value: checkBoxProvider.isChecked,
                            onChanged: (value) {
                              checkBoxProvider.toggleCheckbox(value!);
                            },
                          ),
                          CustomRichText(
                            fstText: 'I agree to the ',
                            lstText: 'Terms and Conditions',
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      DoubleText(
                        fstText: 'Already have an account?',
                        lstText: 'Sign In',
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signIn);
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomRoundedButton(
                        btnName: 'Sign Up',
                        isLoading: context.watch<AuthProvider>().isLoading,
                        onPress: () async {
                          String name = nameController.text.trim();
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          String whNumber = wpPhoneController.text.toString();
                          String mobileNum = phoneController.text.toString();

                          if (name.isNotEmpty &&
                              email.isNotEmpty &&
                              password.isNotEmpty &&
                              whNumber.isNotEmpty &&
                              mobileNum.isNotEmpty) {
                            bool success = await authProvider.signUp(
                              name,
                              email,
                              password,
                            );

                            context.read<UserDataProvider>().setUserData(
                              name,
                              email,
                              whNumber,
                            );
                            if (success) {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.otpVerification,
                              );
                            } else {
                              Utils.flushBarErrorMessage(
                                "Error ${authProvider.error}",
                                context,
                              );
                            }
                          } else {
                            Utils.flushBarErrorMessage(
                              'All fields are required',
                              context,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
