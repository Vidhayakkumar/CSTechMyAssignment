
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/providers/userDatatProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_colors.dart';


class Utils{

  static void showSnackBar( BuildContext context, String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg))
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(15.r),
      backgroundColor: AppColors.btnColor,
      textDirection: TextDirection.rtl,
      forwardAnimationCurve: Curves.decelerate,
      padding: const EdgeInsets.all(15),
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.easeInOut,
      icon: const Icon(Icons.error, size: 25, color: Colors.white),
    ).show(context);
  }

  static void openWhatsApp(BuildContext context, String number)async{

    String contactNumber = '+91${number}';
    if (Platform.isAndroid) {
      String url ='whatsapp://send?phone=${contactNumber}&text=Hy';
      await launchUrl(Uri.parse(url));
    }
  }

}