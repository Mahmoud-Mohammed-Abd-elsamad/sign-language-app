import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';
import 'package:sigin_lang_app/core/utils/app_images.dart';
import 'package:sigin_lang_app/core/utils/componants/custom_button.dart';
import 'package:sigin_lang_app/features/login_screen/presentation/pages/loginScreen.dart';

import '../../config/routes/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var onBoarding = AppImages.onBoardingImage1;
  var setStateCount = 0;
  var lastOnBoarding = false;


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      setStateCount++;
      if (setStateCount <= 1) {
        onBoarding = AppImages.onBoardingImage2;
        setState(() {});
      } else if (setStateCount <= 2) {
        lastOnBoarding = true;
        setState(() {
        });
      }
    });
    return Scaffold(
      body: lastOnBoarding
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.w),
                      child: Text(
                          "Sign Language",
                        style: GoogleFonts.poppins(
                            color: AppColors.secondaryColor,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 8.w),
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.poppins(
                        color: AppColors.secondaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/welcome_sign.png"),
                ),
                SizedBox(height: 16.w,),
                Container(
                  //color: Colors.green,
                  height: 220.w,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    CustomButton(text: "Login", onTap: (){
                      Navigator.pushNamed(context, Routes.loginScreen);
                      setState(() {
                      });

                    }, backgroundColor: Colors.transparent, borderColor: AppColors.primaryColor,),
                    Text(
                      "OR",
                      style: GoogleFonts.poppins(
                          color: AppColors.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    CustomButton(text: 'Sign Up', onTap: () {
                      Navigator.pushNamed(context, Routes.registerScreen);
                      setState(() {
                      });

                    }, backgroundColor: Colors.transparent, borderColor: AppColors.primaryColor,),
                  ]),
                )
              ],
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                onBoarding,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}

