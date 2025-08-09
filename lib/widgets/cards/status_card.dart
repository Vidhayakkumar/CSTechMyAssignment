import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text/custom_small_text.dart';


class StatusCard extends StatelessWidget {
  final String title;
  final int? count;
  final Color backgroundColor;
  final Color lineColor;

  const StatusCard({
    super.key,
    required this.title,
    required this.count,
    required this.backgroundColor,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 70.h,
        width: 110.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Row(
            children: [
              Container(
                width: 5.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: lineColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSmallText(
                    text: title,
                    fontSize: 13.sp,
                    fontFamily: FontWeight.bold,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: count.toString(),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' Calls',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
