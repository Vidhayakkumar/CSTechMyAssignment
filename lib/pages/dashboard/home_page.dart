
import 'package:flutter/material.dart';
import 'package:my_assign/providers/userDatatProvider.dart';
import 'package:my_assign/res/utils.dart';
import 'package:my_assign/routes/app_.routes.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/res/app_colors.dart';
import 'package:my_assign/widgets/button/custom_rounded_button.dart';
import 'package:my_assign/widgets/text/custom_small_text.dart';
import '../../widgets/header/app_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        "https://youtu.be/bP4U-L4EHcg?si=Nq58SfKhPXcVyQhu",
      )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              // Header
              HeaderPart(
                image: 'assets/images/profile.png',
                name: 'Hello Swati',
                about: 'Calley Personal',
              ),

              SizedBox(height: 20.h),

              // Video container
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 330.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: CustomSmallText(
                          text:
                          '''If you are here for the first time then ensure that you have uploaded the list to call from calley Web Panel hosted on https://app.getcalley.com''',
                          fontSize: 12.sp,
                          textColor: Colors.white,
                          fontFamily: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 250.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: FittedBox(
                        child: YoutubePlayer(
                          controller: youtubePlayerController,
                          showVideoProgressIndicator: true,
                          bottomActions: const [],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              const Spacer(),

              // Bottom buttons
              Row(
                children: [
                  GestureDetector(
                    onTap:()   {
                        String phone= userData.whNumber;
                       Utils.openWhatsApp(context, phone);

                    },
                    child: Container(
                      width: 50.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Center(
                        child:
                        Image.asset('assets/images/whatsApp_img.png'),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w),
                  CustomRoundedButton(
                    btnName: 'Start Calling Now ',
                    width: 275.w,
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.dashboard);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
