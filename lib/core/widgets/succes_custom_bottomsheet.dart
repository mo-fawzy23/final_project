import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../feature/auth/presentation/login_screen.dart';

class SuccesCustomBottomsheet extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final GestureTapCallback onTapWhere;
  const SuccesCustomBottomsheet({super.key, required this.image, required this.title, required this.subTitle,required this.onTapWhere});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 517.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 66.7.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColor.secondaryText,
                  borderRadius: BorderRadius.circular(11.r),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            SvgPicture.asset(image),
            SizedBox(height: 24.h),
            Text(
              textAlign: TextAlign.center,
              title,
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryText,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              textAlign: TextAlign.center,
              subTitle,
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  color: AppColor.secondaryText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            CustomConfirmButton(
              text: "Continue",
              onTapWhere: onTapWhere,
            ),
          ],
        ),
      ),
    );
  }
}
