import 'package:final_project/feature/auth/widgets/otb_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtbCustomComponent extends StatelessWidget {
  const OtbCustomComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OtbCustom(),
        SizedBox(width: 12.w,),
        OtbCustom(),
        SizedBox(width: 12.w,),
        OtbCustom(),
        SizedBox(width: 12.w,),
        OtbCustom(),
      ],
    );
  }
}
