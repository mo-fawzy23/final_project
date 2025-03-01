import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/feature/auth/presentation/login_screen.dart';
import 'package:final_project/feature/profile/presentation/edit_profile_screen.dart';
import 'package:final_project/feature/profile/presentation/payment_methods.dart';
import 'package:final_project/feature/profile/presentation/privacy_screen.dart';
import 'package:final_project/feature/profile/widgets/custom_divider.dart';
import 'package:final_project/feature/profile/widgets/custom_list_tile_profile.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
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
                Icons.person_search,
                color: AppColor.primaryText,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 314.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff2BA8CF).withAlpha(50), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.5],
                ),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8.h),
                  Image.asset(Assets.pngsProfile, height: 100.h, width: 100.h),
                  SizedBox(height: 16.h),
                  Text(
                    "Bryan Adam",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryText,
                      ),
                    ),
                  ),
                  Text(
                    "bryan.adam87@gmail.com",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -120.h),
              child: Container(
                width: double.infinity,
                height: 1018.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "Account Settings",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.secondaryText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomListTileProfile(
                      onTapWhere: () {},
                      icon: Icon(Icons.location_on_outlined, size: 24.r),
                      title: "Address",
                    ),
                    CustomListTileProfile(
                      onTapWhere: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentMethods(),
                          ),
                        );
                      },
                      icon: Icon(Icons.credit_card, size: 24.r),
                      title: "Payment Method",
                    ),
                    CustomListTileProfile(
                      onTapWhere: (){},
                      icon: Icon(Icons.notifications_none, size: 24.r),
                      title: "Notifications",
                    ),
                    CustomListTileProfile(
                      onTapWhere: (){},
                      icon: Icon(Icons.verified_user_outlined, size: 24.r),
                      title: "Account Security",
                      isLast: true,
                    ),
                    const CustomDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "General",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.secondaryText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomListTileProfile(
                      onTapWhere: (){},
                      icon: Icon(CupertinoIcons.person_2, size: 24.r),
                      title: "Invite Friends",
                    ),
                    CustomListTileProfile(
                      onTapWhere: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.lock_outlined, size: 24.r),
                      title: "Privacy Policy",
                    ),
                    CustomListTileProfile(
                      onTapWhere: (){},
                      icon: Icon(Icons.info_outline_rounded, size: 24.r),
                      title: "Help Center",
                      isLast: true,
                    ),
                    const CustomDivider(),
                    CustomListTileProfile(
                      onTapWhere: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (predicate) => false,
                        );
                      },
                      icon: Icon(
                        Icons.logout_outlined,
                        size: 24.r,
                        color: Colors.red,
                      ),
                      title: "Logout",
                      isLast: true,
                      isLogout: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
