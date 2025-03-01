import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:final_project/core/network/local/cache/cash_helper.dart';
import 'package:final_project/core/network/local/data_base/local_db_helper.dart';
import 'package:final_project/core/network/remote/dio_helper.dart';
import 'package:final_project/feature/auth/presentation/login_screen.dart';
import 'package:final_project/feature/auth/presentation/otb_screen.dart';
import 'package:final_project/feature/auth/presentation/register_screen.dart';
import 'package:final_project/feature/home/presentation/notification_screen.dart';
import 'package:final_project/feature/inbound/presentation/first_inbound_screen.dart';
import 'package:final_project/feature/intro/presentation/splash_screen.dart';
import 'package:final_project/feature/profile/presentation/add_payment_method.dart';
import 'package:final_project/feature/profile/presentation/payment_methods.dart';
import 'package:final_project/feature/profile/presentation/privacy_screen.dart';
import 'package:final_project/feature/profile/presentation/profile_screen.dart';
import 'package:final_project/generated/assets.dart';
import 'package:final_project/layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SQLHelper.initDb();
  await CacheHelper.init();
  runApp(const SplashScreen());
}



