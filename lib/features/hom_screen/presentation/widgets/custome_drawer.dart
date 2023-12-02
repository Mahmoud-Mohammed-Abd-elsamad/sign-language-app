import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigin_lang_app/core/utils/app_colors.dart';
import 'package:sigin_lang_app/core/utils/app_icons.dart';
import 'package:sigin_lang_app/core/utils/app_images.dart';
import 'package:sigin_lang_app/features/hom_screen/presentation/pages/litters_screen.dart';
import 'package:sigin_lang_app/features/hom_screen/presentation/pages/numders_screen.dart';

import '../../../../core/utils/componants/custom_title_sign_language.dart';
import '../pages/colors_screen.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key,})
      : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60,),
        Center(child: CustomTitleSignLanguage(fontSize: 28.sp,)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NumbersScreen()),
                  );
                  setState(() {});
                },
                child: Image.asset(AppImages.numbersImage,width: 164.w,height: 214.w,)
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorsScreen()),
                  );
                  setState(() {});
                },
                child:  Image.asset(AppImages.colorsImage,width: 164.w,height: 214.w,),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlphabetScreen()),
                  );
                  setState(() {});
                },
                child: Image.asset(AppImages.alphabetImage,width: 164.w,height: 214.w,),
              )
            ],
          ),
        ),
      ],
    );
  }
}
