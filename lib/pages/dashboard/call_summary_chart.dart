import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/providers/call_list_provider.dart';
import 'package:my_assign/providers/userDatatProvider.dart';
import 'package:my_assign/res/app_colors.dart';
import 'package:my_assign/widgets/button/custom_rounded_button.dart';
import 'package:my_assign/widgets/drawer/drawer_header.dart';
import 'package:my_assign/widgets/drawer/drawer_tile.dart';
import 'package:provider/provider.dart';
import '../../widgets/cards/status_card.dart';
import '../../widgets/text/custom_small_text.dart';

class CallSummaryChart extends StatefulWidget {
  CallSummaryChart({super.key});

  @override
  State<CallSummaryChart> createState() => _CallSummaryChartState();
}

class _CallSummaryChartState extends State<CallSummaryChart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CallListProvider>(context, listen: false).getListDetails();

    });
  }

  @override
  Widget build(BuildContext context) {
   final usedData = Provider.of<UserDataProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Drawer(
          backgroundColor: Color(0xFFEEF4FE),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              children: [
                DrawerHeaderWidget(image: 'assets/images/profile.png', name: usedData.name, email: usedData.email),
                SizedBox(height: 15.h),
                DrawerTile(iconPath: 'assets/images/getStart.png', title: 'Getting Started'),
                DrawerTile(iconPath: 'assets/images/sync_data.png', title: 'Sync Data'),
                DrawerTile(iconPath: 'assets/images/gamification.png', title: 'Gamification'),
                DrawerTile(iconPath: 'assets/images/send_logs.png', title: 'Send Logs'),
                DrawerTile(iconPath: 'assets/images/setting.png', title: 'Settings'),
                DrawerTile(iconPath: 'assets/images/music.png', title: 'Help?'),
                DrawerTile(iconPath: 'assets/images/cancel_sub.png', title: 'Cancel Subscription'),
                Divider(color: AppColors.borderColor),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    'App Info',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.btnColor),
                  ),
                ),
                SizedBox(height: 10.h),
                DrawerTile(iconPath: 'assets/images/about.png', title: 'About Us'),
                DrawerTile(iconPath: 'assets/images/privacy.png', title: 'Privacy Policy'),
                DrawerTile(iconPath: 'assets/images/version.png', title: 'Version 1.01.52'),
                DrawerTile(iconPath: 'assets/images/share.png', title: 'Share App'),
                DrawerTile(iconPath: 'assets/images/logout.png', title: 'Loguot'),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset('assets/images/dashboard.png'),
        ),
        titleSpacing: -10,
        title: CustomSmallText(
          text: 'DASHBOARD',
          fontSize: 17.sp,
          fontFamily: FontWeight.bold,
        ),
        actions: [
          Image.asset('assets/images/music.png'),
          SizedBox(width: 15.w),
          Image.asset('assets/images/notification.png'),
          SizedBox(width: 15.w),
        ],
      ),
      body: Consumer<CallListProvider>(
        builder: (context, listProvider, child) {
          if (listProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.btnColor),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                // Test list part
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomSmallText(
                                text: 'Test List',
                                fontSize: 18.sp,
                                fontFamily: FontWeight.w500,
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${(listProvider.listModel?.pending ?? 0)
                                            + (listProvider.listModel?.called ?? 0)
                                            + (listProvider.listModel?.rescheduled ?? 0)}',
                                        style: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.btnColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' CALLS',
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Image.asset('assets/images/S.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // pieChartGraph
                SizedBox(height: 30.h),
                SizedBox(
                  height: 200.h,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 5,
                      centerSpaceRadius: 60.r,
                      startDegreeOffset: -90.r,
                      sections: [
                        PieChartSectionData(
                          color: AppColors.blueColor,
                          value: listProvider.listModel?.pending?.toDouble() ?? 0,
                          showTitle: false,
                          radius: 35.r,
                        ),
                        PieChartSectionData(
                          color: AppColors.deepColor,
                          value: listProvider.listModel?.rescheduled?.toDouble() ?? 0,
                          showTitle: false,
                          radius: 45.r,
                        ),
                        PieChartSectionData(
                          color: AppColors.orangeColor,
                          value: listProvider.listModel?.called?.toDouble() ?? 0,
                          showTitle: false,
                          radius: 35.r,
                        ),
                      ],
                    ),
                  ),
                ),

                // status
                SizedBox(height: 30.h),
                Row(
                  children: [
                    StatusCard(
                      title: 'Pending',
                      count: listProvider.listModel?.pending?.toInt() ?? 0,
                      backgroundColor: AppColors.lightOrangeColor,
                      lineColor: AppColors.orangeColor,
                    ),
                    SizedBox(width: 5.w),
                    StatusCard(
                      title: 'Done',
                      count: listProvider.listModel?.called?.toInt() ?? 0,
                      backgroundColor: AppColors.lightGreen,
                      lineColor: AppColors.greenColor,
                    ),
                    SizedBox(width: 5.w),
                    StatusCard(
                      title: 'Schedule',
                      count: listProvider.listModel?.rescheduled?.toInt() ?? 0,
                      backgroundColor: AppColors.lightDeep,
                      lineColor: AppColors.deepColor,
                    ),
                  ],
                ),

                Spacer(),
                // button
                CustomRoundedButton(btnName: 'Start Calling Now', onPress: () {}),
                SizedBox(height: 50.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
