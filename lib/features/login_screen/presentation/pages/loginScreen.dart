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
      body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('register failure1')),
          );
          return _showAlertDialog(context);
        } else if (state is LoginSuccess) {
          // CacheHelper.saveData(stringToken: state.model.token!);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('register success')),
          );
        }
      }, builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: context.read<LoginCubit>().formKey,
                child: SingleChildScrollView(
                  reverse: true, // this is new
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 68.w,
                      ),
                      CustomTitleSignLanguage(
                        fontSize: 36.sp,
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
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
                            controller:
                                context.read<LoginCubit>().emailController,
                            suffixIcon: null,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Text(
                            "Password",
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          CustomFormTextField(
                            validator: (String) {
                              if (String == null || String.isEmpty) {
                                return "this field is required";
                              }
                              return null;
                            },
                            hintText: "",
                            keyboardType: TextInputType.visiblePassword,
                            controller:
                                context.read<LoginCubit>().passController,
                            suffixIcon:
                                const Icon(CupertinoIcons.eye_slash_fill),
                            onPressedIcon: () {
                              context.read<LoginCubit>().obscureTextFunction();
                            },
                            obscureText: context.read<LoginCubit>().obscureText,
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: CustomButton(
                                text: "Sign in",
                                onTap: () {
                                  if (context
                                      .read<LoginCubit>()
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    // context
                                    //     .read<LoginCubit>().login();
                                    ////>>>>>>>>>>>>>>>>>>>>>>.
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.homeScreen, (route) => false);
                                  }
                                },
                                backgroundColor: Colors.white,
                                borderColor: Colors.white,
                                width: 230,
                                height: 48,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          );
        }
      }),
    );
  }

  void _showAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Error'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Register Failed'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
