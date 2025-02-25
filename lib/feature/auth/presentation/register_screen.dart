import 'package:final_project/core/widgets/cutom_text_field.dart';
import 'package:final_project/feature/auth/presentation/login_screen.dart';
import 'package:final_project/feature/auth/widgets/auth_options.dart';
import 'package:final_project/feature/auth/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

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
                TextHeader(header: "Create your new account"),
                SizedBox(height: 24.h,),
        
                CustomTextInput(
                  hintText: "Email address",
                  labelText: "Email Address",
                  controller: emailController,
                ),
                SizedBox(height: 16.h),
                CustomTextInput(
                  hintText: "Password",
                  labelText: "Password",
                  controller: passwordController,
                ),
                SizedBox(height: 16.h),
                CustomTextInput(
                  hintText: "Confirm password",
                  labelText: "Confirm Password",
                  controller: confirmPasswordController,
                ),
                SizedBox(height: 24.h,),
                AuthOptions(haveAnAccountOrNo: "Have an account?",loginOrRegisterScreen: "Login",textLR: "Register",screen: LoginScreen(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
