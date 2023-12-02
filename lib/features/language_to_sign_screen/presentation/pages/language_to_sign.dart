import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';

class LanguageToSignScreen extends StatelessWidget {
  const LanguageToSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500.w,
              width: 350.w,
              decoration: BoxDecoration(color: Colors.blue),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16),
               child: TextField(

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: AppColors.secondaryColor,),
                    borderRadius: BorderRadius.circular(50)//<-- SEE HERE
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: AppColors.secondaryColor),
                        borderRadius: BorderRadius.circular(50)//<-- SEE HERE
                    ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: AppColors.secondaryColor),
                      borderRadius: BorderRadius.circular(50)//<-- SEE HERE
                  ),
                ),
            ),
             )

          ],
        ),
      ),
    );
  }
}
