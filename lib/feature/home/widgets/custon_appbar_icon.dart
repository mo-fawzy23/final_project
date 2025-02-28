import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustonAppbarIcon extends StatelessWidget {
  final Widget icon;
  const CustonAppbarIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xfffd919d),
      ),
      child: IconButton(
          onPressed: () {},
          icon: icon),
    );
  }
}
