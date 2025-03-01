import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        const Divider(thickness: 3, color: Color(0xffF0F1F5)),
        SizedBox(height: 24.h),
      ],
    );
  }
}
