import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/res/app_colors.dart';
import 'package:my_assign/routes/app_.routes.dart';
import 'package:my_assign/widgets/text/custom_big_texf.dart';
import 'package:my_assign/widgets/button/custom_rounded_button.dart';
import 'package:my_assign/widgets/text/custom_small_text.dart';
import 'package:my_assign/widgets/text/double_text.dart';
import 'package:my_assign/widgets/textField/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Image.asset('assets/images/Logo.png',height: 60.h,),
                  SizedBox(height: 20.h),

                  // White container
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 60.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Scrollable middle content
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomBigText(
                                        text: 'Welcome!', fontSize: 30.sp),
                                    CustomSmallText(
                                        text: 'Please sign-in to continue',
                                        fontSize: 15.sp),
                                    SizedBox(height: 30.h),

                                    CustomTextField(
                                      controller: emailController,
                                      hintText: 'Email address',
                                      suffixImage: 'assets/images/email.png',
                                    ),
                                    SizedBox(height: 35.h),

                                    CustomTextField(
                                      controller: passwordController,
                                      hintText: 'Password',
                                      suffixImage: 'assets/images/password.png',
                                    ),
                                    SizedBox(height: 5.h),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('Forgot Password?',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold

                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Fixed bottom content
                            Column(
                              children: [
                                DoubleText(
                                    fstText: "Don't have an account?",
                                    lstText: 'Sign Up',
                                    onTap:() {
                                     Navigator.pushNamed(context, AppRoutes.signUp);
                                    },
                                ),
                                SizedBox(height: 10.h),
                                CustomRoundedButton(
                                  btnName: 'Sign In',
                                  onPress: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      AppRoutes.homePage,
                                          (route) => false,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
