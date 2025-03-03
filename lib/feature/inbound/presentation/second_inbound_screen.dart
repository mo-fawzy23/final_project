import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/feature/home/presentation/main_screen.dart';
import 'package:final_project/feature/inbound/presentation/third_inbound_screen.dart';
import 'package:final_project/feature/inbound/widgets/custom_circle_progress.dart';
import 'package:final_project/feature/inbound/widgets/inbound_widget.dart';
import 'package:final_project/generated/assets.dart';
import 'package:final_project/layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondInboundScreen extends StatelessWidget {
  const SecondInboundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeLayout()),
              );
            },
            child: Text(
              "Skip",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.primaryText,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h),
          const InboundWidget(
            title: "Get those shopping bags filled",
            pic: Assets.svgsInbound2,
            subtitle:
                "Add any item you want to your cart or save it on your wishlist, so you don't miss it in your future purchase.",
          ),
          SizedBox(height: 32.h),
          const CustomCircleProgress(value: 0.75, screen: ThirdInboundScreen()),
        ],
      ),
    );
  }
}
