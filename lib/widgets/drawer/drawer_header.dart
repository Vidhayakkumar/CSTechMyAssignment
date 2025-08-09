import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/res/app_colors.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final String image;
  final String name;
  final String email;

  const DrawerHeaderWidget({
    super.key,
    required this.image,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.btnColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: ListTile(
          leading: Image.asset(image),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' • Personal',
                  style: TextStyle(
                    color: AppColors.orangeColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Text(
            email,
            style: TextStyle(
              color: AppColors.orangeColor,
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}

