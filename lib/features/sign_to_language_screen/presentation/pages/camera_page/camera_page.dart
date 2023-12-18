import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:sigin_lang_app/features/hom_screen/presentation/manager/home_cubit.dart';
import 'package:sigin_lang_app/features/hom_screen/presentation/pages/home_screen.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/entities/sign_to_language_body.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/presentation/manager/sign_to_language_cubit.dart';

import '../../../../../config/routes/routes.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);
  static List picture = [];
  static String? videos;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.amber,
      onImageCaptured: (value) {
        final path = value.path;

        print("::::::::::::::::::::::::::::::::: $path");
        if (path.contains('.jpg')) {
          CameraPage.picture.add(value.path);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.signToLanguageScreen, (route) => false);
        }
      },
      onVideoRecorded: (value) {
        final path = value.path;
        CameraPage.videos = value.path;
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.signToLanguageScreen, (route) => false);
        print('::::::::::::::::::::::::;; video pth $path');

        ///Show video preview .mp4
      },
    );
    // return Container();
  }
}

