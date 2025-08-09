import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/res/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String suffixImage;
  final String? prefixImage;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixImage,
    this.prefixImage,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(15.r),
      borderOnForeground: true,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.borderColor,
          ),
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              suffixIcon: Image.asset(suffixImage),
              prefixIcon: prefixImage != null ? Image.asset(prefixImage!) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
