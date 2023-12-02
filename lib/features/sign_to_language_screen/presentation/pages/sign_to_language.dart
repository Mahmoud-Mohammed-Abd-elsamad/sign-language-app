import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sigin_lang_app/config/routes/routes.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../../core/utils/componants/custom_icon_button.dart';
import 'camera_page/camera_page.dart';

class SignToLanguageScreen extends StatefulWidget {
  const SignToLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SignToLanguageScreen> createState() => _SignToLanguageScreenState();
}

class _SignToLanguageScreenState extends State<SignToLanguageScreen> {
  String imagePath = "";

  FlutterTts flutterTts = FlutterTts();

  Future<void> configureTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Sign to language ",
          style: GoogleFonts.poppins(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.w,
            ),
            Stack(children: [
              Container(
                height: 500.w,
                width: 350.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.w))),
              ),
              Positioned(
                top: 400,
                right: 15,
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.transparent),
                  child: Center(
                      child: Text(
                    "hello iam mahmoud",
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 21.sp),
                  )),
                ),
              ),
            ]),
            SizedBox(
              height: 32.w,
            ),
            Row(children: [
              CustomCircleIconButton(
                width: 50,
                height: 50,
                icon: CupertinoIcons.speaker_1_fill,
                iconSize: 25,
                onTap: (){
                    speakText();
                },
              ),
            ]),
            Row(
              children: [
                CustomCircleIconButton(
                  width: 50,
                  height: 50,
                  icon: Icons.image,
                  iconSize: 25,
                  onTap: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile == null) return;
                    imagePath = File(pickedFile.path).path;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 90.w,
                ),
                CustomCircleIconButton(
                  width: 70,
                  height: 70,
                  icon: Icons.camera_alt_outlined,
                  iconSize: 30,
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CameraPage()));
                    setState(() {});
                  },
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
  void speakText() async {
    await flutterTts.speak("Hello iam Mahmoud");
  }

  void stopSpeaking() async {
    await flutterTts.stop();
  }
}
