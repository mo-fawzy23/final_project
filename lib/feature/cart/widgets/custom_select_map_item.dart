import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSelectMapItem extends StatelessWidget {
  final String title1;
  final String title2;
  final String icon;
  bool isSelected;

  CustomSelectMapItem({
    super.key,
    required this.title1,
    required this.title2,
    required this.icon,
    this.isSelected = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Color(0xffff9c44):AppColor.line,width: 2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.h),
                decoration: const BoxDecoration(
                  color: Color(0xfff3f6fb),
                  shape: BoxShape.circle,
                ),
                child: Text(icon),
              ),
              SizedBox(width: 8.w),
              Text(
                title1,
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontWeight: isSelected? FontWeight.w700 :FontWeight.w400,
                    color: isSelected ? Color(0xffff9c44): AppColor.primaryText,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    title2,
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "+201123246463",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.primaryText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Image.asset(Assets.pngsImg4, height: 64.h, width: 64.w),
            ],
          ),
        ],
      ),
    );
  }
}
