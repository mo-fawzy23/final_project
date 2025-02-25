import 'package:final_project/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class OtbCustom extends StatelessWidget {
  const OtbCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w,vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColor.secondaryText.withValues(alpha: 0.2),
        ),
      ),
      width: 74.w,
      height: 73.h,
      child: TextField(
        style: GoogleFonts.plusJakartaSans(
          textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.primaryText,
              fontSize: 32.sp
          ),
        ),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
