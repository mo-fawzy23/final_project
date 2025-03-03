import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/network/local/data_base/local_db_helper.dart';
import 'package:final_project/feature/home/data/model/product_model.dart';
import 'package:final_project/feature/home/logic/home_cubit.dart';
import 'package:final_project/feature/home/presentation/notification_screen.dart';
import 'package:final_project/feature/home/presentation/products_details_screen.dart';
import 'package:final_project/feature/home/widgets/adv_widget.dart';
import 'package:final_project/feature/home/widgets/custom_timer.dart';
import 'package:final_project/feature/home/widgets/custon_appbar_icon.dart';

// import 'package:final_project/feature/home/widgets/list_view_item.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
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
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(14.r),
                                bottomLeft: Radius.circular(14.r),
                              ),
                              gradient: const LinearGradient(
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
                            child: Column(
                              children: [
                                SizedBox(height: 35.h),
                                ConditionalBuilder(
                                  condition:
                                      context.watch<HomeCubit>().userData !=
                                      null,
                                  builder: (context) {
                                    var user =
                                        context.watch<HomeCubit>().userData;

                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      child: Row(
                                        children: [
                                          CustonAppbarIcon(
                                            onPressed: () {},
                                            icon: Icon(
                                              CupertinoIcons.location_solid,
                                              color: Colors.white,
                                              size: 24.r,
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Location",
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 12.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                              ),
                                              SizedBox(height: 2.h),
                                              Text(
                                                "${user!.address!.city}",
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          CustonAppbarIcon(
                                            icon: Transform.rotate(
                                              angle: 270,
                                              child: Icon(
                                                CupertinoIcons.bell_fill,
                                                color: Colors.white,
                                                size: 24.r,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          const NotificationScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  fallback: (BuildContext context) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Find best device for\nyour setup!",
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: TextStyle(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            // width: double.infinity,
                            height: 1020.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 207.h),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Hot Deals🔥",
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                            color: AppColor.primaryText,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      CustomTimer(),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Container(
                                  child: ConditionalBuilder(
                                    condition:
                                        context
                                            .read<HomeCubit>()
                                            .products
                                            .isNotEmpty,
                                    builder:
                                        (context) => buildLoaded(
                                          context.watch<HomeCubit>().products,
                                          context,
                                        ),
                                    fallback: (context) => buildLoading(),
                                  ),
                                ),
                                SizedBox(height: 38.h),
                                Text(
                                  "You May Like",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp,
                                      color: AppColor.primaryText,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Container(
                                  child: ConditionalBuilder(
                                    condition:
                                        context
                                            .read<HomeCubit>()
                                            .products
                                            .isNotEmpty,
                                    builder:
                                        (context) => Expanded(
                                          child: buildLoadedGrid(
                                            context.watch<HomeCubit>().products,
                                            context,
                                          ),
                                        ),
                                    fallback: (context) => buildLoading(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AdvWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget buildLoading() {
  return Center(child: CircularProgressIndicator());
}

Widget buildLoaded(List<ProductModel> products, BuildContext contextC) {
  return Container(
    width: double.infinity,
    height: 250.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      // padding: EdgeInsets.symmetric(horizontal: 11),
      // scrollDirection: Axis.horizontal,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider.value(
                      value: BlocProvider.of<HomeCubit>(contextC)
                        ..getSingleProduct(products[index].id!),
                      child: ProductsDetailsScreen(),
                    ),
              ),
            );
          },
          child: Container(
            width: 160.w,
            height: 240.h,
            margin: EdgeInsets.only(right: 16.w,top: 1.h,bottom: 1.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 0.25,
                ),
              ],
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Image.network(
                  products[index].image!,
                  height: 123.h,
                  width: 131.w,
                ),
                SizedBox(height: 4.h),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  products[index].title!,
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryText,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "\$${products[index].price!}",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.loginRegisterTextButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget buildLoadedGrid(List<ProductModel> products, BuildContext contextD) {
  return Container(
    // width: double.infinity,
    height: 100.h,
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16.h,
        mainAxisSpacing: 24.w,
        childAspectRatio: 1 / 1.45,
        crossAxisCount: 2,
      ),
      // padding: EdgeInsets.symmetric(horizontal: 11),
      // scrollDirection: Axis.horizontal,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider.value(
                      value: BlocProvider.of<HomeCubit>(contextD)
                        ..getSingleProduct(products[index].id!),
                      child: ProductsDetailsScreen(),
                    ),
              ),
            );
          },
          child: Container(
            width: 160.w,
            height: 240.h,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 0.25,
                ),
              ],
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Image.network(
                  products[index].image!,
                  height: 123.h,
                  width: 131.w,
                ),
                SizedBox(height: 4.h),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  products[index].title!,
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryText,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "\$${products[index].price!}",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.loginRegisterTextButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget buildError() {
  return Center(child: Text("Error"));
}
