
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/app_colors.dart';

class HeaderPart extends StatelessWidget {
  final String image;
  final String name;
  final String about;
  const HeaderPart({
    super.key,
    required this.image,
    required this.name,
    required this.about
  });

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.maxFinite,
      height: 70.h,
      decoration: BoxDecoration(
          color: AppColors.btnColor,
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: ListTile(
        leading: Image.asset(image),
        title:  Text(name,style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500
        ),),
        subtitle:Text(about,style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
