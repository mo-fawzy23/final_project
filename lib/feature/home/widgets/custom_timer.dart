import 'package:final_project/core/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            "02",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryText,
              ),
            ),
          ),
        ),
        SizedBox(width: 2.w,),
        Icon(Icons.more_vert),
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            "12",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryText,
              ),
            ),
          ),
        ),
        SizedBox(width: 2.w,),
        Icon(Icons.more_vert),
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            "09",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
