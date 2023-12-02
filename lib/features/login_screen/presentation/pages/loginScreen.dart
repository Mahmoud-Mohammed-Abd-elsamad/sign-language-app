import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';
import 'package:sigin_lang_app/core/utils/componants/custom_button.dart';
import 'package:sigin_lang_app/core/utils/componants/custome_form_text_field.dart';
import 'package:sigin_lang_app/features/login_screen/presentation/manager/login_cubit.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/componants/custom_title_sign_language.dart';
import 'package:sigin_lang_app/core/utils/componants/custome_form_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.w,
              ),
              Center(
                  child: CustomTitleSignLanguage(
                fontSize: 36.w,
              )),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.w,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                          fontSize: 15.w,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    CustomFormTextField(
                        validator: (String) {
                          if (String == null || String.isEmpty) {
                            return "this field is required";
                          }
                          return null;
                        },
                        hintText: "",
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        controller: context.read<LoginCubit>().emailController,
                        suffixIcon: null,
                        onPressedIcon: (value) {}),
                    SizedBox(
                      height: 32.w,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                          fontSize: 15.w,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    CustomFormTextField(
                        validator: (String) {
                          if (String == null || String.isEmpty) {
                            return "this field is required";
                          }
                          return null;
                        },
                        hintText: "",
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        controller: context.read<LoginCubit>().emailController,
                        suffixIcon: null,
                        onPressedIcon: (value) {}),
                    SizedBox(
                      height: 32.w,
                    ),
                    Center(
                      child: CustomButton(text: "Login", onTap: (){
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.homeScreen, (route) => false);
                        //   if (context
                        //       .read<RegisterCubit>()
                        //       .formKey
                        //       .currentState!
                        //       .validate()) {
                        //     context
                        //         .read<RegisterCubit>().register();
                        //   }
                      }, backgroundColor: Colors.white, borderColor: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
