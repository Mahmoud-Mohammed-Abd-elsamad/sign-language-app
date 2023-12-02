import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigin_lang_app/features/hom_screen/presentation/pages/home_screen.dart';
import 'package:sigin_lang_app/features/login_screen/presentation/manager/login_cubit.dart';
import 'package:sigin_lang_app/features/on_boarding/on_boarding_screen.dart';
import 'package:sigin_lang_app/features/register_screen/presentation/manager/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/hom_screen/presentation/manager/home_cubit.dart';
import '../../features/login_screen/presentation/pages/loginScreen.dart';
import '../../features/on_boarding/splash_screen.dart';
import '../../features/register_screen/data/data_sources/data_source.dart';
import '../../features/register_screen/presentation/pages/register_screen.dart';
import '../../features/sign_to_language_screen/presentation/pages/camera_page/camera_page.dart';

class Routes {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "onBoardingScreen";
  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String homeScreen = "homeScreen";
  static const String cameraScreen = "cameraScreen";
}

class AppRoutes {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) {
          return OnBoardingScreen();
        });

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(create: (BuildContext context) =>LoginCubit(),
          child: const LoginScreen());
        });

      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(create: (BuildContext context) =>RegisterCubit(RemoteDataSource()),
          child: const RegisterScreen());
        });

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(create: (BuildContext context) => HomeCubit(),
          child: HomeScreen());
        });

      case Routes.cameraScreen:
        return MaterialPageRoute(builder: (context) {
          return CameraPage();
        });


      default:
        return MaterialPageRoute(builder: (context) {
          return unDefindScreen();
        });
    }
  }

  static Widget unDefindScreen() {
    return const Scaffold(
      body: Center(child: Text("Undefind screen")),
    );
  }
}
