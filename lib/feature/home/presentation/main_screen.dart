import 'package:final_project/feature/home/widgets/adv_widget.dart';
import 'package:final_project/feature/home/widgets/custon_appbar_icon.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 255.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffFD6C8A),
                          Color(0xffFDA56C),
                          Color(0xffFEB5AE),
                        ],
                        stops: [0.2, 0.8, 0.9],
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(height: 35.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            CustonAppbarIcon(icon: Icon(CupertinoIcons.location_solid,
                              color: Colors.white, size: 24.r,)),
                            SizedBox(width: 12.w,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("Location",style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp,
                                  color: Colors.white
                                ),
                              ),),
                                SizedBox(height: 2.h,),
                                Text("Cairo",style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: Colors.white
                                  ),
                                ),),
                              ],
                            ),
                            Spacer(),
                            CustonAppbarIcon(icon: Transform.rotate(angle: 270,
                              child: Icon(CupertinoIcons.bell_fill,
                                color: Colors.white, size: 24.r,),
                            ))
                          ],
                        ),
                      )
                    ]),
                  ),
                  Container(
                    width: double.infinity,
                    height: 460.h,
                    child: Column(children: []),
                  ),
                ],
              ),
            ),
            AdvWidget(),
          ],
        ),
      ),
    );
  }
}
