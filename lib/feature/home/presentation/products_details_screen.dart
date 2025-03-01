import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/network/local/data_base/local_db_helper.dart';
import 'package:final_project/feature/home/logic/home_cubit.dart';
import 'package:final_project/feature/profile/widgets/custom_divider.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.secondaryText.withValues(alpha: 0.2),
                    ),
                  ),
                  child: const Icon(
                    CupertinoIcons.arrow_left,
                    color: AppColor.primaryText,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.secondaryText.withValues(alpha: 0.2),
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.heart,
                      color: AppColor.circleProgress,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                condition: context.read<HomeCubit>().product != null,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        context.read<HomeCubit>().product!.title!,
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryText,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "\$${context.read<HomeCubit>().product!.price!}",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.loginRegisterTextButton,
                          ),
                        ),
                      ),
                      Image.asset(Assets.pngsImg3, width: 375.w, height: 283.h),
                      SizedBox(height: 12.h),
                      Text(
                        "Space grey",
                        style: TextStyle(color: AppColor.secondaryText),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 48.h,
                                  width: 48.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 3,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Positioned(
                                  top: 8.h,
                                  left: 8.w,
                                  child: Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 18.w),
                            Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomDivider(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Description",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryText,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              context.read<HomeCubit>().product!.description!,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CupertinoColors.systemGrey6,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            try {
                              var data = context.read<HomeCubit>().product;
                              await SQLHelper.add(
                                  data!.id.toString(),
                                  data.title!,
                                  data.description ?? "",
                                  data.image!,
                                  1,
                                  data.price!.toDouble());
                            } catch (e) {
                              print(e);
                            }
                          },
                          icon: Icon(CupertinoIcons.shopping_cart),
                        ),
                      ),
                    ],
                  );
                },
                fallback: (BuildContext context) {
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          );
        },
      )
    ;
  }
}
