import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/core/widgets/cutom_text_field.dart';
import 'package:final_project/feature/auth/presentation/otb_screen.dart';
import 'package:final_project/feature/auth/presentation/register_screen.dart';
import 'package:final_project/feature/auth/widgets/auth_options.dart';
import 'package:final_project/feature/auth/widgets/text_header.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24.h),
                const TextHeader(header: 'Login to your account.'),
                SizedBox(height: 32.h),
                CustomTextInput(
                  hintText: "UserName",
                  labelText: "UserName",
                  controller: userNameController,
                ),
                SizedBox(height: 16.h),
                CustomTextInput(
                  isPassword: true,
                  hintText: "Password",
                  labelText: "Password",
                  controller: passwordController,
                ),
                SizedBox(height: 24.h),
                TextButton(
                  onPressed: () {
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
                            height: 334.h,
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
                                  "Forget Password",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24.sp,
                                    color: AppColor.primaryText,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  "Select which contact details should we use to reset your password",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: AppColor.secondaryText,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 24),
                                  padding: EdgeInsets.all(
                                    16.h
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(color: AppColor.line),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding : EdgeInsets.all(10.h),
                                        decoration: BoxDecoration(
                                          color: AppColor.sendBorderColorIcon,
                                          borderRadius: BorderRadius.circular(12.r)
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.iconsSendIcon,
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Send via Email",
                                            style: GoogleFonts.plusJakartaSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.primaryText,
                                            ),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Container(
                                            width: 200.w,
                                            height: 25.h,
                                            child: TextField(
                                              style: GoogleFonts.plusJakartaSans(
                                                decorationThickness: 0,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.primaryText,
                                              ),
                                              decoration: InputDecoration(
                                              border: InputBorder.none,

                                            ),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                CustomConfirmButton(text: "Continue",onTapWhere: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OtbScreen()));
                                },)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Forget Your Password?",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColor.primaryText,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                AuthOptions(
                  haveAnAccountOrNo: "Don't have an account?",
                  loginOrRegisterScreen: "Register",
                  textLR: "Login",
                  screen: RegisterScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
