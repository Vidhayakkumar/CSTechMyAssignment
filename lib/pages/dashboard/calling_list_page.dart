
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/routes/app_.routes.dart';
import '../../res/app_colors.dart';
import '../../widgets/text/custom_small_text.dart';

class CallingListPage extends StatefulWidget {
  const CallingListPage({super.key});

  @override
  State<CallingListPage> createState() => _CallingListPageState();
}

class _CallingListPageState extends State<CallingListPage> {
  @override
  void initState() {
    super.initState();

    // Show BottomSheet after UI is built
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => _buildBottomSheetContent(),
      );
    });
  }

  Widget _buildBottomSheetContent() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250.h,
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r),
              )
            ),child: Padding(
              padding: EdgeInsets.all(10.r),
              child: CustomSmallText(text: 'CALLING LISTS', fontSize: 16.sp,textColor: Colors.white,),
            ),
          ),
          Positioned(
            left: 1,
            right: 1,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: 210.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r),
                  )
              ),child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.backGroundColor,
                      borderRadius: BorderRadius.circular(15.r)
                    ),child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSmallText(text: 'Select Calling List', fontSize: 15.sp,fontFamily: FontWeight.bold,),
                        Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(5.r)
                              ),child: Row(
                              children: [
                                SizedBox(width: 2.w,),
                                Icon(Icons.cached_rounded,color: Colors.white,size: 25.sp,),
                                SizedBox(width: 5.w,),
                                CustomSmallText(text: 'Refresh', fontSize: 15.sp,textColor: Colors.white,)
                              ],
                            ),
                            ),
                          ],
                        )
                      ],
                                        ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: AppColors.backGroundColor,
                        borderRadius: BorderRadius.circular(15.r)
                    ),child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSmallText(text: 'Test list', fontSize: 15.sp,fontFamily: FontWeight.bold,),
                        InkWell(
                          onTap: (){
                           Navigator.pushNamed(context, AppRoutes.callSummaryChart);
                          },
                            child: Image.asset('assets/images/right_arrow.png'))

                      ],
                                        ),
                    ),
                  ),
                )
              ],
            ),
            ),
          )
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    // 🔁 Your full previous UI code goes here
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        titleSpacing: -10,
        title: CustomSmallText(
          text: 'Settings',
          fontSize: 17.sp,
          fontFamily: FontWeight.bold,
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            // header
            Flexible(
              child: Container(
                width: double.maxFinite,
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColors.btnColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                    visualDensity: VisualDensity(vertical: 1),
                      leading: Image.asset('assets/images/profile.png'),
                      title: Text(
                        'Hello Swati',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text('swati@cstech.in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('7423458324',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Parent Account : N/A',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Current Subscription: Calley Personal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            // video
            SizedBox(height: 20.h),

            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 350.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: CustomSmallText(
                        text: 'PROFILE SETTINGS',
                        fontSize: 18.sp,
                        textColor: Colors.white,
                        fontFamily: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 310.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.w),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: AppColors.backGroundColor,
                                borderRadius: BorderRadius.circular(15.r)
                            ),child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.blur_circular_outlined),
                                    SizedBox(width: 10.w,),
                                    CustomSmallText(text: 'App language', fontSize: 15.sp,fontFamily: FontWeight.bold,),
                                  ],
                                ),

                                InkWell(
                                    onTap: (){

                                    },
                                    child: Image.asset('assets/images/right_arrow.png'))

                              ],
                            ),
                          ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: AppColors.backGroundColor,
                                borderRadius: BorderRadius.circular(15.r)
                            ),child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.lock),
                                    SizedBox(width: 10.w,),
                                    CustomSmallText(text: 'Change Password', fontSize: 15.sp,fontFamily: FontWeight.bold,),
                                  ],
                                ),

                                InkWell(
                                    onTap: (){

                                    },
                                    child: Image.asset('assets/images/right_arrow.png'))

                              ],
                            ),
                          ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: AppColors.backGroundColor,
                                borderRadius: BorderRadius.circular(15.r)
                            ),child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person_2_outlined),
                                    SizedBox(width: 10.w,),
                                    CustomSmallText(text: 'Abouts', fontSize: 15.sp,fontFamily: FontWeight.bold,),
                                  ],
                                ),

                                InkWell(
                                    onTap: (){

                                    },
                                    child: Image.asset('assets/images/right_arrow.png'))

                              ],
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
