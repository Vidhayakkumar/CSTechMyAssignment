import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/providers/userDatatProvider.dart';
import 'package:my_assign/res/utils.dart';
import 'package:my_assign/routes/app_.routes.dart';
import 'package:my_assign/widgets/text/custom_small_text.dart';
import 'package:provider/provider.dart';

import '../../res/app_colors.dart';

import '../../widgets/button/custom_rounded_button.dart';
import '../../widgets/header/app_bar.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final usedData = Provider.of<UserDataProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        leading: Image.asset('assets/images/dashboard.png'),
        titleSpacing: -10,
        title: CustomSmallText(
          text: 'DASHBOARD',
          fontSize: 17.sp,
          fontFamily: FontWeight.bold,
        ),
        actions: [
          Image.asset('assets/images/music.png'),
          SizedBox(width: 10.w),
          Image.asset('assets/images/notification.png'),
          SizedBox(width: 15.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              // Header
              HeaderPart(
                image: 'assets/images/profile.png',
                name: 'Hello Swati',
                about: 'Calley Personal',
              ),
              SizedBox(height: 15.h),
        
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Stack
                      Stack(
                        children: [
                          Container(
                            height: 350.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: CustomSmallText(
                                text: 'LOAD NUMBER TO CALL',
                                fontSize: 18.sp,
                                textColor: Colors.white,
                                fontFamily: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 300.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(color: AppColors.borderColor),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 18.h),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Visit ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'https://app.getcalley.com ',
                                            style: TextStyle(
                                              color: AppColors.btnColor,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            'to upload\nnumbers that you wish to call using Calley\nMobile App.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              height: 1.5,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 42.h),
                                  Flexible(
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Image.asset(
                                        'assets/images/calling.png',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            GestureDetector(

              onTap:()=> Utils.openWhatsApp(context, usedData.whNumber),
              child: Container(
                width: 50.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.green),
                ),
                child: Center(
                  child: Image.asset('assets/images/whatsApp_img.png'),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            CustomRoundedButton(
              btnName: 'Start Calling Now',
              width: 270.w,
              onPress: () {
               Navigator.pushNamed(context, AppRoutes.callingListPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
