import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/feature/cart/presentation/edit_map_Details.dart';
import 'package:final_project/feature/cart/presentation/payment_method_order.dart';
import 'package:final_project/feature/cart/widgets/custom_select_map_item.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MapDetails extends StatelessWidget {
  const MapDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Select Address",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditMapDetails()),
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
                CupertinoIcons.add,
                color: AppColor.circleProgress,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            CustomSelectMapItem(
              icon: "🏠",
              title1: "Home",
              title2: "Zaytoun,Cairo",
            ),
            SizedBox(height: 16.h),
            CustomSelectMapItem(
              icon: "🏢",
              title1: "Office",
              title2: "Zaytoun,Cairo",
              isSelected: true,
            ),
            SizedBox(height: 16.h),
            CustomSelectMapItem(
              icon: "🏘️",
              title1: "Home",
              title2: "Zaytoun,Cairo",
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomConfirmButton(text: "Select Addresss", onTapWhere: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentMethodOrder()),
                  );
                })),

            SizedBox(height: 8.h,),
          ],
        ),
      ),
    );
  }
}
