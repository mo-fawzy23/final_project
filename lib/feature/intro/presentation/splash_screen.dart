import 'dart:async';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:final_project/feature/auth/presentation/login_screen.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: FlutterSplashScreen.fadeIn(
              duration: const Duration(milliseconds: 3515),
              backgroundColor: Colors.white,
              onInit: () async{
              },
              onEnd: () async{
                debugPrint("On End 1");
              },
              childWidget: SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset(Assets.svgsLogo),
              ),
              nextScreen: LoginScreen(),
            )
          ),
        );
      },
    );
  }
}
