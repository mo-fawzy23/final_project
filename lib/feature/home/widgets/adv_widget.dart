import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvWidget extends StatelessWidget {
  const AdvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 172.h,
      left: 20.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              child: Image.asset(
                Assets.pngsImg1,
                width: 335,
                height: 178,
              ),
            ),
          ),
          Positioned(
            top: 26.h,
            left: 24.w,
            child: Text(
              "New Bing\nWireless\nEarphone",
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  height: 1.1,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 132.h,
            left: 24.w,
            child: Row(
              children: [
                Text(
                  "See Offer",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(

                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 7.w,),
                Icon(Icons.arrow_right_alt,color: Colors.white,)
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(200, -17),
            child: Image.asset(Assets.pngsImg2,width: 111.w,),
          )
        ],
      ),
    );
  }
}
