import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:final_project/feature/inbound/presentation/first_inbound_screen.dart';
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
          home: FlutterSplashScreen.scale(
            duration: const Duration(seconds: 10),
            animationDuration: const Duration(seconds: 10),
            backgroundColor: Colors.white,
            onInit: () {
              // debugPrint("On Init");
            },
            onEnd: () {
              // debugPrint("On End");
            },
            childWidget: SizedBox(
              height: 200.h,
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.svgsLogo),
                    SizedBox(height: 34.h),
                    Text(
                      "zalada",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // onAnimationEnd: () => debugPrint("On Fade In End"),
            nextScreen: FirstInboundScreen(),
          ),
        );
      },
      );
  }
}
