import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTilePayment extends StatelessWidget {
  final String icon;
  final String title;
   String subtitle;
   bool isSvg;
   final Widget trailing;
   CustomListTilePayment({super.key, required this.icon, required this.title,required this.subtitle,this.isSvg = false, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: isSvg? Color(0xffFF9C44) :AppColor.line,),
        borderRadius: BorderRadius.circular(16.r),

      ),
      child: ListTile(
        trailing: trailing,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.all(12.h),
          child: isSvg ? SvgPicture.asset(icon) :Image.asset(icon,),
        ),
        title: Text(title,style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColor.primaryText
            )
        ),),
        subtitle: Text(subtitle,style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColor.secondaryText
            )
        ),),
      ),
    );
  }
}
