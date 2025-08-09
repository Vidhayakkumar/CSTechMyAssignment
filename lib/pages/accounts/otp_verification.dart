import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/pages/dashboard/home_page.dart';
import 'package:my_assign/providers/auth_provider.dart';
import 'package:my_assign/providers/userDatatProvider.dart';
import 'package:my_assign/res/utils.dart';
import 'package:my_assign/widgets/text/custom_big_texf.dart';
import 'package:my_assign/widgets/button/custom_rounded_button.dart';
import 'package:my_assign/widgets/text/custom_small_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../res/app_colors.dart';

class OtpVerificationPage extends StatefulWidget {

  OtpVerificationPage({super.key,});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  late String otp;

  @override
   void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final user = Provider.of<UserDataProvider>(context,listen: false);
       authProvider.sendOtp(user.email).then((success) {
        if (success) {
          Utils.flushBarErrorMessage("OTP sent successfully", context);
        } else {
          Utils.flushBarErrorMessage("Failed to send OTP", context);
        }
      });
    });

  }
  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context,listen: false);
    final userData = Provider.of<UserDataProvider>(context, listen: false);
    print('number'+userData.whNumber);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Image.asset('assets/images/Logo.png',height: 60.h,),
                      SizedBox(height: 20.h),

                      Expanded(
                        child: Container(
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomBigText(
                                  text: 'Whatsapp OTP\nVerification',
                                  fontSize: 30.sp,
                                ),
                                SizedBox(height: 10.h),
                                CustomSmallText(
                                  text:
                                  'Please ensure that the email id mentioned is valid'
                                      '\nas we have sent an OTP to your email.',
                                  fontSize: 13.sp,
                                ),
                                SizedBox(height: 20.h),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Form(
                                    key: _formKey,
                                    child: PinCodeTextField(
                                      controller: _otpController,
                                      appContext: context,
                                      length: 6,
                                      onChanged: (value) {
                                        otp =value;
                                      },
                                      validator: (value){
                                        if(value == null || value.isEmpty || value.length < 6){
                                          return "Please enter a valid 6-digit OTP";
                                        }
                                      },
                                      pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(10.r),
                                        fieldHeight: 40.h,
                                        fieldWidth: 43.w,
                                        inactiveFillColor: Colors.white,
                                        selectedFillColor: Colors.white,
                                        activeFillColor: Colors.white,
                                        inactiveColor:
                                        AppColors.pinCodeBorderColor,
                                        selectedColor:
                                        AppColors.pinCodeBorderColor,
                                        activeColor: AppColors.pinCodeBorderColor,
                                      ),
                                      backgroundColor: Colors.transparent,
                                      enableActiveFill: true,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                CustomSmallText(
                                  text: '+91 ${userData.whNumber}?',
                                  fontSize: 15.sp,
                                ),

                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  CustomSmallText(text: "Didn't receive OTP code?", fontSize: 15.sp),
                                  InkWell(
                                    onTap: () async {
                                      final result = await authProvider.sendOtp(userData.email);
                                      if(result){
                                        Utils.flushBarErrorMessage('OTP successfully send', context);
                                      }else{
                                        Utils.flushBarErrorMessage("Error ${authProvider.error}", context);
                                      }
                                    },
                                    child: Text(' Resend Otp', style: TextStyle(
                                      color: AppColors.btnColor,
                                      fontSize: 15.sp.clamp(10.sp, 20.sp),
                                      fontWeight: FontWeight.bold
                                    ),),
                                  )
                                ],),

                                SizedBox(height: 10.h),
                                CustomRoundedButton(
                                  btnName: 'Verify',
                                  isLoading: context.watch<AuthProvider>().isLoading,
                                  onPress: ()async {

                                    try{
                                      if(_formKey.currentState!.validate()){
                                        final result = await authProvider.otpVerification(userData.email, _otpController.text.trim());

                                        if(result){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                                        }else{
                                          Utils.flushBarErrorMessage("Error ${authProvider.error}", context);
                                        }

                                      }
                                    }catch(e){
                                      Utils.flushBarErrorMessage("Please enter the 6-digit OTP", context);
                                    }

                                      

                                  },
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
