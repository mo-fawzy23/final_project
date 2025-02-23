import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/feature/home/presentation/main_screen.dart';
import 'package:final_project/feature/inbound/presentation/second_inbound_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircleProgress extends StatelessWidget {
  final double value;
  final Widget screen;
  const CustomCircleProgress({super.key, required this.value, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularProgressIndicator(
          value: value,
          strokeWidth: 2,
          valueColor: const AlwaysStoppedAnimation<Color>(
              AppColor.circleProgress),
          backgroundColor: AppColor.circleProgress.withValues(alpha: 0.08),
          constraints: const BoxConstraints(minWidth: 94, minHeight: 94),
        ),
        Positioned(
          left: 16,
          top: 16,
          right: 16,
          bottom: 16,
          child: FilledButton(
            style: ButtonStyle(
              minimumSize: const WidgetStatePropertyAll(Size.fromRadius(31)),
              backgroundColor: const WidgetStatePropertyAll(Color(0xff2D3C52)),
              shape: WidgetStateProperty.all<CircleBorder>(
                  const CircleBorder()),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => screen));
            },
            child: const Icon(
                CupertinoIcons.arrow_right, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }
}
