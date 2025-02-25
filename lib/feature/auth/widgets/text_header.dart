import 'package:final_project/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHeader extends StatelessWidget {
  final String header;

  const TextHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return
      Text(
        header,
        style: GoogleFonts.plusJakartaSans(
          color: AppColor.primaryText,
          fontSize: 32.sp,
        ),
      );
  }
}
