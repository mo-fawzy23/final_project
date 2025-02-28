import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/feature/home/widgets/notification_widget.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.secondaryText.withValues(alpha: 0.2),
              ),
            ),
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: AppColor.primaryText,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Notifications",
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColor.primaryText,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Today",
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColor.secondaryText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  NotificationWidget(
                    icon: Assets.iconsPromotionIcon,
                    title: "30% Special Discount!",
                    subtitle: "Special promotion only valid today",
                  ),
                  Divider(),

                  NotificationWidget(
                    icon: Assets.iconsPromotionIcon,
                    title: "New Apple Promotion",
                    subtitle: "Special promotion only valid today",
                  ),
                  SizedBox(height: 24.h,)
                ],
              ),
            ),
            Divider(color: Color(0xffF0F1F5),thickness: 4,),
            SizedBox(height: 24.h,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yesterday",
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColor.secondaryText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  NotificationWidget(
                    icon: Assets.iconsPromotionIcon,
                    title: "30% Special Discount!",
                    subtitle: "Special promotion only valid today",
                  ),
                  Divider(),

                  NotificationWidget(
                    icon: Assets.iconsPromotionIcon,
                    title: "New Apple Promotion",
                    subtitle: "Special promotion only valid today",
                  ),
                  Divider(),
                  NotificationWidget(
                    icon: Assets.iconsPromotionIcon,
                    title: "New Apple Promotion",
                    subtitle: "Special promotion only valid today",
                  ),],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
