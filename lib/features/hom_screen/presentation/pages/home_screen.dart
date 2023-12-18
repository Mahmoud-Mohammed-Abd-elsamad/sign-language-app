import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigin_lang_app/config/routes/routes.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';
import 'package:sigin_lang_app/core/utils/app_icons.dart';
import 'package:sigin_lang_app/features/language_to_sign_screen/presentation/pages/language_to_sign.dart';
import 'package:sigin_lang_app/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/presentation/pages/sign_to_language.dart';

import '../../../../core/utils/componants/custom_icon_button.dart';
import '../manager/home_cubit.dart';
import '../widgets/custome_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          drawer: const Drawer(
            child: CustomDrawer(),
          ),
          appBar: AppBar(
            elevation: 0.w,
            backgroundColor: AppColors.primaryColor,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ProfileScreen();
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: const Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.black87,
                    size: 30,
                  ),
                ),
              )
            ],
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset(AppIcons.drawerIcon),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          body: Column(
            children: [
              Stack(children: [
                Positioned(
                    top: 60.w,
                    left: 25.w,
                    child: Center(
                        child: Image.asset("assets/images/home_image.png"))),
                Positioned(
                    top: 80.w,
                    left: 290.w,
                    child: ImageIcon(
                      AssetImage(AppIcons.noListenIcon),
                      size: 50,
                    )),
                Positioned(
                    top: 80.w,
                    left: 25.w,
                    child: ImageIcon(
                      AssetImage(AppIcons.noSoundIcon),
                      size: 50,
                    )),
                Container(
                  height: 400.w,
                  width: double.infinity,
                )
              ]),
              SizedBox(
                height: 32.w,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomCircleIconButton(
                            width: 90,
                            height: 90,
                            icon: Icons.camera_alt_outlined,
                            iconSize: 35,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.signToLanguageScreen);
                            },
                          ),
                          Text(
                            "Camera",
                            style: GoogleFonts.poppins(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        CustomCircleIconButton(
                          width: 90,
                          height: 90,
                          icon: Icons.edit_calendar_outlined,
                          iconSize: 35,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LanguageToSignScreen()));
                          },
                        ),
                        Text(
                          "Write",
                          style: GoogleFonts.poppins(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  buildBottomNavigationBarItem(IconData image, bool selected) {
    return BottomNavigationBarItem(
        icon: Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
                color: selected ? Colors.white : AppColors.secondaryColor,
                shape: BoxShape.circle),
            child: Icon(
              image,
              color: selected ? AppColors.secondaryColor : Colors.white,
            )),
        label: "");
  }
}
// bottomNavigationBar: Container(
// decoration: BoxDecoration(
// color: AppColors.primaryColor,
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(20.w),
// topLeft: Radius.circular(20.w)),
// boxShadow: [
// BoxShadow(
// color: Colors.black38,
// spreadRadius: 0.w,
// blurRadius: 10.w),
// ],
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30.0.w),
// topRight: Radius.circular(30.0.w),
// ),
// child: BottomNavigationBar(
// backgroundColor: AppColors.primaryColor,
// onTap: (index) {
// context.read<HomeCubit>().selectedTab(index);
// },
// currentIndex:
// context.read<HomeCubit>().bottomNavigationSelectedIcon,
// items: <BottomNavigationBarItem>[
// buildBottomNavigationBarItem(
// Icons.camera_alt,
// context
//     .read<HomeCubit>()
// .bottomNavigationSelectedIcon ==
// 0),
// buildBottomNavigationBarItem(
// Icons.edit,
// context
//     .read<HomeCubit>()
// .bottomNavigationSelectedIcon ==
// 1),
// ],
// ),
// ),
// ),
