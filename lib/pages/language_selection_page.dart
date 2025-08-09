import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_assign/pages/accounts/signup_page.dart';
import 'package:my_assign/res/app_colors.dart';
import 'package:my_assign/routes/app_.routes.dart';
import 'package:my_assign/widgets/button/custom_rounded_button.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'English';

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'sub': 'Hi'},
    {'name': 'Hindi', 'sub': 'नमस्ते'},
    {'name': 'Bengali', 'sub': 'হ্যালো'},
    {'name': 'Kannada', 'sub': 'ನಮಸ್ಕಾರ'},
    {'name': 'Punjabi', 'sub': 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'},
    {'name': 'Tamil', 'sub': 'வணக்கம்'},
    {'name': 'Telugu', 'sub': 'హలో'},
    {'name': 'French', 'sub': 'Bonjour'},
    {'name': 'Spanish', 'sub': 'Hola'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'Choose Your Language',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1.5
                    ),

                  ),
                  child: ListView.builder(
                    itemCount: _languages.length,
                    itemBuilder: (context, index) {
                      var language = _languages[index];
                      return  Padding(
                        padding:  EdgeInsets.only(left: 10.w, right: 10.w,top: 1.h),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            language['name']!,
                            style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            language['sub']!,
                            style: TextStyle(fontSize: 14.sp, color: Colors.grey,fontWeight: FontWeight.w300),
                          ),
                          trailing: Radio<String>(
                            value: language['name']!,
                            groupValue: _selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                _selectedLanguage = value!;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              _selectedLanguage = language['name']!;
                            });
                          },
                        ),
                      );
                  
                    },
                  ),
                ),
              ),


              SizedBox(height: 10.h),


              CustomRoundedButton(
                  btnName: 'Select',
                  onPress: (){
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  }
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
