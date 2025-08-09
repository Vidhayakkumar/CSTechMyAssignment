import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/pages/accounts/otp_verification.dart';
import 'package:my_assign/pages/accounts/sign_in_page.dart';
import 'package:my_assign/pages/accounts/signup_page.dart';
import 'package:my_assign/pages/dashboard/call_summary_chart.dart';
import 'package:my_assign/pages/dashboard/calling_list_page.dart';
import 'package:my_assign/pages/dashboard/dashboard.dart';
import 'package:my_assign/pages/dashboard/dashboard_home.dart';
import 'package:my_assign/pages/dashboard/home_page.dart';
import 'package:my_assign/pages/language_selection_page.dart';
import 'package:my_assign/providers/auth_provider.dart';
import 'package:my_assign/providers/call_list_provider.dart';
import 'package:my_assign/providers/checkbox_providers.dart';
import 'package:my_assign/providers/userDatatProvider.dart';
import 'package:my_assign/res/app_colors.dart';
import 'package:my_assign/routes/app_.routes.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userDataProvider = UserDataProvider();
  await userDataProvider.loadUserData();
  runApp(

      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>CheckboxProvider()),
            ChangeNotifierProvider(create: (_)=>AuthProvider()),
            ChangeNotifierProvider(create: (_)=>CallListProvider()),
            ChangeNotifierProvider(create: (_)=>UserDataProvider())
          ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(     
           colorScheme: ColorScheme.fromSeed(seedColor: AppColors.backGroundColor),
      ),
        initialRoute: AppRoutes.languagePage,
        onGenerateRoute: AppRoutes.generateRoute,
    ),
    );
  }
}
