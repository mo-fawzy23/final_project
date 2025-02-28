import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  const NotificationWidget({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: Color(0xffF3F6FB),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
      title: Text(title,style: GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: AppColor.primaryText
        )
      ),),
      subtitle: Text(subtitle,style: GoogleFonts.plusJakartaSans(
          textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColor.secondaryText
          )
      ),),
    );
  }
}
