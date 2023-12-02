import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';
import 'package:sigin_lang_app/core/utils/componants/custom_button.dart';
import 'package:sigin_lang_app/core/utils/componants/custom_title_sign_language.dart';
import 'package:sigin_lang_app/core/utils/componants/custome_form_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes.dart';
import '../manager/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if(state is RegisterFailure){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('register failure')),
              );
              return _showAlertDialog(context);
            }else if(state is RegisterSuccess){
             // CacheHelper.saveData(stringToken: state.model.token!);
              Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('register success')),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: context.read<RegisterCubit>().formKey,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16.w,
                            ),
                            Text(
                              "Full Name",
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
                              keyboardType: TextInputType.name,
                              controller:
                                  context.read<RegisterCubit>().nameController,
                              suffixIcon: null,
                              onPressedIcon: (value) {},
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 24.w,
                            ),
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
                                  context.read<RegisterCubit>().emailController,
                              suffixIcon: null,
                              onPressedIcon: (value) {},
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
                              keyboardType: TextInputType.visiblePassword,
                              controller:
                                  context.read<RegisterCubit>().passController,
                              suffixIcon:
                                  const Icon(CupertinoIcons.eye_slash_fill),
                              onPressedIcon: (value) {
                                value = !value;
                                print("sdfsdfsdfsdfsdf  ${value}   4");
                              },
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 24.w,
                            ),
                            Text(
                              "Confirm Password",
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
                              keyboardType: TextInputType.visiblePassword,
                              controller:
                                  context.read<RegisterCubit>().repassController,
                              suffixIcon: const Icon(
                                CupertinoIcons.check_mark_circled,
                                size: 25,
                              ),
                              onPressedIcon: (value) {},
                              obscureText: false,
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
                                  text: "Sign up",
                                  onTap: () {
                                    // Navigator.pushNamedAndRemoveUntil(context,
                                    //    Routes.homeScreen, (route) => false);
                                      if (context
                                          .read<RegisterCubit>()
                                          .formKey
                                          .currentState!
                                          .validate()) {
                                        context
                                            .read<RegisterCubit>().register();
                                      }
                                  },
                                  backgroundColor: Colors.white,
                                  borderColor: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void _showAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
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
