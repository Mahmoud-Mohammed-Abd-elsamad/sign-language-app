import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigin_lang_app/config/routes/routes.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';
import 'package:sigin_lang_app/core/utils/app_images.dart';
import 'package:sigin_lang_app/features/hom_screen/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var splash = AppImages.splashImage1;
  var stateCount = 0;
  bool selected = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.onBoardingScreen, (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      splash = AppImages.splashImage2;
      setState(() {});
    });
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            splash,
            fit: BoxFit.fill,
          )),
    );
  }
}
// Image.asset(splash,fit:BoxFit.cover,),
