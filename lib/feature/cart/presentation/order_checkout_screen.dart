import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/network/local/data_base/local_db_helper.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/core/widgets/succes_custom_bottomsheet.dart';
import 'package:final_project/feature/cart/logic/cart_cubit.dart';
import 'package:final_project/feature/cart/presentation/map_details.dart';
import 'package:final_project/feature/home/logic/home_cubit.dart';
import 'package:final_project/feature/profile/widgets/custom_divider.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCheckoutScreen extends StatelessWidget {
  const OrderCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartData(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Order",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
            ),
            body: ConditionalBuilder(
              condition: context.read<CartCubit>().products.isNotEmpty,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Address",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryText,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Edit",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: AppColor.loginRegisterTextButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),

                      Text(
                        "🏠 Home",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryText,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "10 of Ramadan City",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.secondaryText,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                      Text(
                        "Items",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryText,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      const Divider(thickness: 3, color: Color(0xffF0F1F5)),
                      SizedBox(height: 16.h),
                      Container(
                        height: 200.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: context.watch<CartCubit>().products.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: Color(0xfff3f6fb),
                                    ),
                                    child: Image.network(
                                      context
                                          .read<CartCubit>()
                                          .products[index]
                                          .image!,
                                      width: 89.w,
                                      height: 87.h,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 160.w,
                                        child: Text(
                                          maxLines: 2,
                                          "${context.read<CartCubit>().products[index].title!}",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.primaryText,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        "\$${context.read<CartCubit>().products[index].price!}",
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color:
                                                AppColor
                                                    .loginRegisterTextButton,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Container(
                                              decoration: BoxDecoration(),
                                              child: Icon(Icons.remove_rounded),
                                            ),
                                          ),
                                          SizedBox(width: 2.w),
                                          Text("1"),
                                          SizedBox(width: 2.w),
                                          IconButton(
                                            onPressed: () async {
                                            },
                                            icon: Container(
                                              decoration: BoxDecoration(),
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xfff3f6fb),
                                            ),
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                context
                                                    .read<CartCubit>().deleteProduct(context.read<CartCubit>().products[index].id! , index);
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text("x${context.read<CartCubit>().products[index].quantity}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      const Divider(thickness: 3, color: Color(0xffF0F1F5)),
                      SizedBox(height: 16.h),
                      Text(
                        "Payment Summary",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryText,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              fallback: (context) {
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          height: 517.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20.h),
                              SizedBox(height: 24.h),
                              SvgPicture.asset(Assets.svgsCartEmpty),
                              SizedBox(height: 24.h),
                              Text(
                                textAlign: TextAlign.center,
                                "No Order Shown",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryText,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                textAlign: TextAlign.center,
                                "put something in your cart first",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                    color: AppColor.secondaryText,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 56.h,
              child: CustomConfirmButton(text: "Pay \$${context.read<CartCubit>().totalPrice}", onTapWhere: (){})
              )

          );
        },
      ),
    );
  }
}
