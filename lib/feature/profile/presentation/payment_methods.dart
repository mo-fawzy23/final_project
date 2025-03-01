import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/feature/profile/presentation/add_payment_method.dart';
import 'package:final_project/feature/profile/widgets/custom_List_tile_payment.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

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
              text: "Add New Payment",
              onTapWhere: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (btcontext) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 416.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            topLeft: Radius.circular(20.r),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(height: 18.h),
                            Text(
                              "Add New Payment Method",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: AppColor.primaryText,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            CustomListTilePayment(
                              trailing: const Icon(
                                Icons.check_circle,
                                size: 24,
                                color: Colors.orange,
                              ),
                              icon: Assets.iconsCredit,
                              title: "Credit Or Debit Card",
                              subtitle: "Pay with your Visa or Mastercard",
                              isSvg: true,
                            ),
                            Spacer(),
                            CustomConfirmButton(
                              text: "Continue",
                              onTapWhere: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddPaymentMethod(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    );
                  },
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
