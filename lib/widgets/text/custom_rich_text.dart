
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/res/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String fstText;
  final String lstText;
  final Color? fstColor;
  final Color? lstColor;
  final FontWeight? fontWeight;
  final VoidCallback? onPress;

  const CustomRichText({
    super.key,
    required this.fstText,
    required this.lstText,
    this.fontWeight,
    this.onPress,
    this.fstColor,
    this.lstColor

  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: fstText,
            style: TextStyle(
              color: fstColor?? Colors.black,
              fontSize: 14.sp.clamp(10.sp, 20.sp), // Clamp for safety
            ),
          ),

          TextSpan(
            text: lstText,
            style: TextStyle(
              color: lstColor?? AppColors.btnColor,
              fontSize: 15.sp.clamp(10.sp, 20.sp),
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
