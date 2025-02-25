import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/feature/auth/presentation/login_screen.dart';
import 'package:final_project/feature/auth/widgets/otb_custom_component.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OtbScreen extends StatelessWidget {
  const OtbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "OTP",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.secondaryText.withValues(alpha: 0.2),
              ),
            ),
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: AppColor.primaryText,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              SvgPicture.asset(Assets.svgsOtb),
              SizedBox(height: 24.h),
              Text(
                textAlign: TextAlign.center,
                "Verification code",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryText,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              RichText(
                text: TextSpan(
                  text:
                      "We have sent the code verification to your\n Whatsapp Number",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: AppColor.secondaryText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: " +62812 788 6XXXX",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              const OtbCustomComponent(),
              SizedBox(height: 24.h),
              Text(
                "Recent code in 32s",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryText,
                  ),
                ),
              ),
              SizedBox(height: 71.h),
              CustomConfirmButton(
                text: "Continue",
                onTapWhere: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (btcontext) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          height: 517.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20.h),
                              Center(
                                child: Container(
                                  width: 66.7.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.secondaryText,
                                    borderRadius: BorderRadius.circular(11.r),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              SvgPicture.asset(Assets.svgsOtbSuccess),
                              SizedBox(height: 24.h),
                              Text(
                                textAlign: TextAlign.center,
                                "Congratulations !",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryText,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                textAlign: TextAlign.center,
                                "Your account is ready to use. You will be redirected to the Homepage in a few seconds.",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                    color: AppColor.secondaryText,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              CustomConfirmButton(
                                text: "Continue",
                                onTapWhere: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),(predicate) => false);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
