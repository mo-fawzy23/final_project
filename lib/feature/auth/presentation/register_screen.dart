import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/core/widgets/cutom_text_field.dart';
import 'package:final_project/feature/auth/logic/auth_cubit.dart';
import 'package:final_project/feature/auth/presentation/login_screen.dart';
import 'package:final_project/feature/auth/widgets/auth_options.dart';
import 'package:final_project/feature/auth/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthRegisterLoading) {
              showDialog(
                context: context,
                builder:
                    (context) =>
                    Center(child: CircularProgressIndicator()),
              );
            }
            if (state is AuthRegisterSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Success Registeration")),
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),(predicate)=>false
              );
            }
            if (state is AuthRegisterFailed) {

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },

          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 24.h),
                      TextHeader(header: "Create your new account"),
                      SizedBox(height: 24.h),

                      CustomTextInput(
                        hintText: "Username",
                        labelText: "UserName",
                        controller: userNameController,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextInput(
                        hintText: "Email address",
                        labelText: "Email Address",
                        controller: emailController,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextInput(
                        hintText: "Phone Number",
                        labelText: "Phone Number",
                        controller: phoneController,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextInput(
                        isPassword: true,
                        hintText: "Password",
                        labelText: "Password",
                        controller: passwordController,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextInput(
                        isPassword: true,
                        hintText: "Confirm password",
                        labelText: "Confirm Password",
                        controller: confirmPasswordController,
                      ),
                      SizedBox(height: 24.h),
                      CustomConfirmButton(
                        text: "Register",
                        onTapWhere: () {
                          context.read<AuthCubit>().register(
                            userNameController.text,
                            passwordController.text,
                            emailController.text,
                            phoneController.text,
                          );
                        },
                      ),
                      AuthOptions(
                        haveAnAccountOrNo: "Have an account?",
                        loginOrRegisterScreen: "Login",
                        textLR: "Register",
                        screen: LoginScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
