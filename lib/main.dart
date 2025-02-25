import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:final_project/feature/auth/presentation/login_screen.dart';
import 'package:final_project/feature/auth/presentation/otb_screen.dart';
import 'package:final_project/feature/auth/presentation/register_screen.dart';
import 'package:final_project/feature/inbound/presentation/first_inbound_screen.dart';
import 'package:final_project/feature/intro/presentation/splash_screen.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen()
        );
      },
      );
  }
}
