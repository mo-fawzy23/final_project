import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/widgets/custom_confirm_button.dart';
import 'package:final_project/core/widgets/succes_custom_bottomsheet.dart';
import 'package:final_project/feature/cart/logic/cart_cubit.dart';
import 'package:final_project/feature/cart/presentation/map_details.dart';
import 'package:final_project/feature/home/logic/home_cubit.dart';
import 'package:final_project/feature/profile/widgets/custom_divider.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
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
              surfaceTintColor: Colors.transparent,
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Cart",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: context.read<CartCubit>().products.isNotEmpty,
              builder: (context) {
                return GridView.builder(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing:  25,
                      childAspectRatio: 1 / 1.30,crossAxisCount: 2),
                  // padding: EdgeInsets.symmetric(horizontal: 11),
                  // scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: context.watch<CartCubit>().products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return  Container(
                      width: 160.w,
                      height: 240.h,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 20.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 0.25,
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.r)
                      ),
                      child: Column(
                        children: [
                          Image.network(context.watch<CartCubit>().products[index].image!,height: 123.h,width: 131.w,),
                          SizedBox(height: 4.h,),
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            context.watch<CartCubit>().products[index].title!,style: GoogleFonts.plusJakartaSans(textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryText
                          )),),
                          SizedBox(height: 4.h,),
                          Text("\$${context.watch<CartCubit>().products[index].price!}",style: GoogleFonts.plusJakartaSans(textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.loginRegisterTextButton,
                          )),),
                        ],
                      ),
                    );
                  },
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
                                "Cart is empty, Sorry",
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
                                "Nothing here mate",
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
              height: 60,
              child: Center(
                child: CustomConfirmButton(text: "Checkout", onTapWhere: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MapDetails()));
                })
              ),
            ),
          );
        },
      ),
    );
  }
}
