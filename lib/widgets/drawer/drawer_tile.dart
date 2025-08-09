
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/app_colors.dart';

class DrawerTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  const DrawerTile({
    required this.iconPath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.w),
      child: ListTile(
        dense: true,
        onTap: onTap,
        leading: Container(
          width: 50.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 5, offset: Offset(0, -2), color: AppColors.borderColor)],
          ),
          child: Image.asset(iconPath),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
      ),
    );
  }
}
