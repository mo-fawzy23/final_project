import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundProducts,
      body: SafeArea(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.r),
                border: Border.all(color: AppColor.line )
              ),
              child: Row(
                children: [
                  Icon(Icons.search_outlined,color: Colors.black,size: 24.r,),
                  SizedBox(width: 12.w,),

                  Expanded(child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search laptop, headset..",
                      hintStyle: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400
                        )
                      )
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 8.h,),

          ],
        ),
      )),
    );
  }
}
