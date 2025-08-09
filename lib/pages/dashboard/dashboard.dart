import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/pages/dashboard/dashboard_home.dart';
import 'package:my_assign/res/app_colors.dart';

class Dashboard extends StatefulWidget {
   Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndexPage =2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      bottomNavigationBar: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bottomNavBarColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
          ),
          border: Border.symmetric(
            horizontal: BorderSide(
              color: AppColors.btnColor
            )
          )
        ),
        child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: Colors.transparent,
            indicatorColor: AppColors.btnColor,
            onDestinationSelected: (int index){
              setState(() {
                currentIndexPage = index;
              });
            },
            selectedIndex: currentIndexPage,
            destinations: <Widget> [
              NavigationDestination(
                selectedIcon: Image.asset('assets/images/home.png',color: Colors.white,),
                  icon: Image.asset('assets/images/home.png'),
                  label: ''
              ),
              NavigationDestination(
                  selectedIcon: Image.asset('assets/images/contact.png',color: Colors.white,),
                  icon: Image.asset('assets/images/contact.png'),
                  label: ''
              ),
              NavigationDestination(
                  selectedIcon: Image.asset('assets/images/play.png',),
                  icon: Image.asset('assets/images/play.png',color: Colors.black,),
                  label: ''
              ),
              NavigationDestination(
                  selectedIcon: Image.asset('assets/images/call.png',color: Colors.white,),
                  icon: Image.asset('assets/images/call.png'),
                  label: ''
              ),
              NavigationDestination(
                  selectedIcon: Image.asset('assets/images/calendar.png',color: Colors.white,),
                  icon: Image.asset('assets/images/calendar.png'),
                  label: ''
              )
            ]
        ),
      ),
      body: [
        DashboardHome(),
        DashboardHome(),
        DashboardHome(),
        DashboardHome(),
        DashboardHome()

      ][currentIndexPage]
    );
  }
}
