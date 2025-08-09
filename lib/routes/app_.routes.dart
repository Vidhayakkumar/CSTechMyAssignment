
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_assign/pages/accounts/signup_page.dart';
import 'package:my_assign/pages/dashboard/call_summary_chart.dart';
import 'package:my_assign/pages/dashboard/calling_list_page.dart';
import 'package:my_assign/pages/dashboard/dashboard.dart';
import 'package:my_assign/pages/dashboard/dashboard_home.dart';
import 'package:my_assign/pages/dashboard/home_page.dart';
import 'package:my_assign/pages/language_selection_page.dart';

import '../pages/accounts/otp_verification.dart';
import '../pages/accounts/sign_in_page.dart';

class AppRoutes{

  static const String languagePage = "/language";
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String otpVerification = '/otp_verification';
  static const String  homePage = '/home_page';
  static const String dashboardHome = '/dashboard_home';
  static const String dashboard= '/dashboard';
  static const String callingListPage = '/calling_page';
  static const String callSummaryChart = '/call_summary_chart';



  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case languagePage :
        return MaterialPageRoute(builder: (_)=>LanguageSelectionPage());

      case signIn:
        return MaterialPageRoute(builder: (_)=>SignInPage());

      case signUp:
        return MaterialPageRoute(builder: (_)=> SignupPage());

      case otpVerification:
        return MaterialPageRoute(builder: (_)=>OtpVerificationPage());

      case homePage:
        return MaterialPageRoute(builder: (_)=> HomePage());

      case dashboardHome:
        return MaterialPageRoute(builder: (_)=> DashboardHome());

      case dashboard:
        return MaterialPageRoute(builder: (_)=> Dashboard());

      case callingListPage:
        return MaterialPageRoute(builder: (_)=> CallingListPage());
      case callSummaryChart:
        return MaterialPageRoute(builder: (_)=> CallSummaryChart());

      default:
        return MaterialPageRoute(builder: (_)=> SizedBox.shrink()
        );
    }
  }


}