import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/core/widgets/cutom_text_field.dart';
import 'package:final_project/core/widgets/succes_custom_bottomsheet.dart';
import 'package:final_project/feature/profile/presentation/payment_methods.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class AddPaymentMethod extends StatelessWidget {
  AddPaymentMethod({super.key});

  TextEditingController idCard = TextEditingController();

  TextEditingController nameCardHolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 229.h,
                  decoration: BoxDecoration(color: Color(0xff2BA8CF)),
                  child: Column(
                    children: [
                      SizedBox(height: 18.28.h),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Container(
                              padding: EdgeInsets.all(12.h),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColor.secondaryText.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                              ),
                              child: const Icon(
                                CupertinoIcons.arrow_left,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 58.w),
                          Text(
                            "Add New Card",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -18.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: double.infinity,
                    height: 583.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 150.h),
                        CustomTextInput(
                          hintText: "Card name",
                          labelText: "Card Name",
                          controller: nameCardHolder,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextInput(
                          hintText: "Card number",
                          labelText: "Card Number",
                          controller: nameCardHolder,
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextInput(
                                  hintText: "Expiry data",
                                  labelText: "Expiry Data",
                                  controller: nameCardHolder,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: CustomTextInput(
                                  hintText: "CVV",
                                  labelText: "CVV",
                                  controller: nameCardHolder,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 89.h),
                        CustomConfirmButton(
                          text: "Add Payment",
                          onTapWhere: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (btcontext) {
                                return SuccesCustomBottomsheet(
                                  image: Assets.svgsOtbSuccess,
                                  title: "Congratulations !",
                                  subTitle:
                                      "your card is ready to use congrats my friend",
                                  onTapWhere: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 114.h,
              left: 20.w,
              child: Stack(
                children: [
                  Image.asset(Assets.pngsPayment),
                  Positioned(
                    top: 23.h,
                    left: 25.w,
                    child: Text(
                      "SoCard",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 152.h,
                    left: 25.w,
                    child: Text(
                      "Card Holder Name",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 152.h,
                    left: 134.w,
                    child: Text(
                      "Expiry date",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170.h,
                    left: 25.w,
                    child: Text(
                      "Bryan Adam",
                      // nameCardHolder.text,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 83.h,
                    left: 25.w,
                    child: Text(
                      "3434 3254 3423 3443",
                      // nameCardHolder.text,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170.h,
                    left: 134.w,
                    child: Text(
                      "10/26",
                      // nameCardHolder.text,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
