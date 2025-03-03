import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/core/widgets/cutom_text_field.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditMapDetails extends StatelessWidget {
  TextEditingController addressController = TextEditingController();

  EditMapDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "New Address",
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
            onPressed: () {},
            icon: Container(
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColor.secondaryText.withValues(alpha: 0.2),
                ),
              ),
              child: const Icon(
                CupertinoIcons.search,
                color: AppColor.circleProgress,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  Assets.pngsImg5,
                  width: 335.w,
                  height: 378.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24.h),
        
              Text(
                "Select your location from the map",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryText
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Move the pin on the map to find your location and select the delivery address",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondaryText
                ),
              ),
              SizedBox(height: 16.h),
        
              CustomTextInput(
                hintText: "Address",
                labelText: "Address Detail",
                controller: addressController,
                foundSuffixIcon: true,
              ),
              // Spacer(),
              SizedBox(height: 55.h,),
              CustomConfirmButton(text: "Confirm Address", onTapWhere: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
