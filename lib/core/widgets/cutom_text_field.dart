import 'package:final_project/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final bool foundSuffixIcon;

  const CustomTextInput({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
    this.foundSuffixIcon = false,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: AppColor.secondaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            suffixIcon: foundSuffixIcon ? Icon(Icons.location_on_outlined,size: 26.r,): Container(width: 1,),
            hintText: hintText,
            hintStyle: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              color: AppColor.secondaryText,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.line, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.line, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.line, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
