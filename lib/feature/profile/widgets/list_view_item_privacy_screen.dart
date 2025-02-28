import 'package:final_project/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewItemPrivacyScreen extends StatelessWidget {
  final int index;
  final String title;
  final String subTitle;

  const ListViewItemPrivacyScreen({
    super.key,
    required this.index,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${index}. $title",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryText,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "$subTitle",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryText,
              ),
            ),
          ),
          SizedBox(height: 24.h,)
        ],
      ),
    );
  }
}
