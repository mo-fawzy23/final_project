import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InboundWidget extends StatelessWidget {
  final String pic;
  final String title;
  final String subtitle;

  const InboundWidget({
    super.key,
    required this.pic,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          SvgPicture.asset(pic),
          SizedBox(height: 40.h),
          Text(
            textAlign: TextAlign.center,
            title,
            style: GoogleFonts.plusJakartaSans(
              textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryText,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            textAlign: TextAlign.center,
            subtitle,
            style: GoogleFonts.plusJakartaSans(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColor.secondaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
