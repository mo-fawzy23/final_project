import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/feature/auth/widgets/custom_google.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthOptions extends StatelessWidget {
  final String loginOrRegisterScreen;
  final String haveAnAccountOrNo;
  final String textLR;
  final Widget screen;
  const AuthOptions({super.key,required this.loginOrRegisterScreen, required this.textLR, required this.haveAnAccountOrNo, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        CustomConfirmButton(text:textLR,onTapWhere: (){},),
        SizedBox(height: 32.h),
        Row(
          children: [
            Container(
              height: 2.h,
              width: 90.w,
              decoration: const BoxDecoration(color: AppColor.line),
            ),
            SizedBox(width: 16.w),
            Text(
              "or continue with",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16.sp,
                color: AppColor.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 13.w),
            Container(
              height: 2.h,
              width: 90.w,
              decoration: const BoxDecoration(color: AppColor.line),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        const CustomGoogle(
          title: "Continue With Google",
          imageIcon: Assets.svgsIconGoogle,
        ),
        SizedBox(height: 16.h),
        const CustomGoogle(
          title: "Continue with facebook",
          imageIcon: Assets.svgsIconFacebook,
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              haveAnAccountOrNo,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.secondaryText,
              ),
            ),
            SizedBox(width: 1.w),
            TextButton(
              onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> screen));
              },
              child: Text(
                loginOrRegisterScreen,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColor.loginRegisterTextButton,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
