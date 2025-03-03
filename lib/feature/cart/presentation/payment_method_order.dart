import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/feature/cart/presentation/order_checkout_screen.dart';
import 'package:final_project/feature/profile/widgets/custom_List_tile_payment.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodOrder extends StatelessWidget {
  const PaymentMethodOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Payment Method",
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomListTilePayment(
              trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 20),
              icon: "assets/app/images/pngs/master_card.png",
              title: "Master Card",
              subtitle: "**** **** 0783 7873",
            ),
            SizedBox(height: 20.h),
            CustomListTilePayment(
              trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 20),
              icon: "assets/app/images/pngs/img.png",
              title: "Pay Pal",
              subtitle: "**** **** 0783 7873",
            ),
            SizedBox(height: 20.h),
            CustomListTilePayment(
              trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 20),
              icon: "assets/app/images/pngs/apple_pay.png",
              title: "Apple Pay",
              subtitle: "**** **** 0783 7873",
            ),
            Spacer(),
            CustomConfirmButton(
              text: "Continue",
              onTapWhere: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderCheckoutScreen()),
                );
              },
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
