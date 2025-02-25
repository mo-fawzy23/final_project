import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGoogle extends StatelessWidget {
  final String title;
  final String imageIcon;

  const CustomGoogle({
    super.key,
    required this.title,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(34.r),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34.r),
              border: Border.all(color: AppColor.line),
            ),
            child: Row(
              children: [
                SvgPicture.asset(imageIcon),
                SizedBox(width: 42.w),
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
