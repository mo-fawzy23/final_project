import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTileProfile extends StatelessWidget {
  bool isLogout;
  final Icon icon;
  final String title;
  final GestureTapCallback onTapWhere;
  bool isLast;
  CustomListTileProfile({super.key, required this.icon, required this.title,this.isLast = false,this.isLogout = false, required this.onTapWhere});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: InkWell(
        onTap: onTapWhere,
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            border: isLast ? const Border.fromBorderSide(BorderSide.none) :Border(bottom: BorderSide(color: AppColor.line))
          ),
          child: ListTile(
            trailing: isLogout? Container(width: 5.w,) :Icon(Icons.arrow_forward_ios_outlined, size: 20.r),
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                color: Color(0xfff3f6fb),
                shape: BoxShape.circle
              ),
              child: icon,
            ),
            title: Text(title,style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: isLogout? Colors.red :AppColor.primaryText
                )
            ),),
          ),
        ),
      ),
    );
  }
}
