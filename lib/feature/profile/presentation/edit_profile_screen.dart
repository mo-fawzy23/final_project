import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/core/widgets/cutom_text_field.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
   EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Edit Profile",
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Center(child: Stack(
                children: [
                  Image.asset(Assets.pngsProfile,height: 120.h,width: 120.w,),
                  Positioned(
                    top: 100.h,
                      left: 50.w,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, -10),
                              blurRadius: 30,
                              spreadRadius: 2,
                            )
                          ]
                        ),
                        child: Text("Edit",style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.white
                          )
                        ),),
                      ))
        
                ],
              )),
              SizedBox(height: 24.h,),
              CustomTextInput(hintText: "Name", labelText: "Fullname", controller: nameController),
              SizedBox(height: 16.h,),
              CustomTextInput(hintText: "Date", labelText: "Date Of Birth", controller: nameController),
              SizedBox(height: 16.h,),
              CustomTextInput(hintText: "Email", labelText: "Email-Address", controller: nameController),
              SizedBox(height: 16.h,),
              CustomTextInput(hintText: "Number", labelText: "Phone Number", controller: nameController),
              SizedBox(height: 16.h,),
              CustomTextInput(hintText: "Gender", labelText: "Gender", controller: nameController),
              SizedBox(height: 16.h,),
              CustomConfirmButton(text: "Save Changes", onTapWhere: (){})
        
        
            ],
          ),
        ),
      ),
    );
  }
}
