import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/feature/home/data/model/product_model.dart';
import 'package:final_project/feature/home/logic/home_cubit.dart';
import 'package:final_project/feature/home/presentation/main_screen.dart';
import 'package:final_project/feature/home/presentation/products_details_screen.dart';
import 'package:final_project/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit()..getHomeData(),
  child: Scaffold(
      backgroundColor: AppColor.backgroundProducts,
      body: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SafeArea(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.r),
                border: Border.all(color: AppColor.line )
              ),
              child: Row(
                children: [
                  Icon(Icons.search_outlined,color: Colors.black,size: 24.r,),
                  SizedBox(width: 12.w,),

                  Expanded(child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search laptop, headset..",
                      hintStyle: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400
                        )
                      )
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 8.h,),
            Expanded(
              child: Container(
                child: ConditionalBuilder(
                  condition:
                  context.read<HomeCubit>().products.isNotEmpty,
                  builder:
                      (context) => buildLoadedGrid2(
                    context.watch<HomeCubit>().products,
                    context,
                  ),
                  fallback: (context) => buildLoading2(),
                ),
              ),
            ),

          ],
        ),
      ));
  },
),
    ),
);
  }
}
Widget buildLoadedGrid2(List<ProductModel> products, BuildContext contextF) {
  return Container(
    // width: double.infinity,
    // height: 240.h,
    child: GridView.builder(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing:  25,
          childAspectRatio: 1 / 1.45,crossAxisCount: 2),
      // padding: EdgeInsets.symmetric(horizontal: 11),
      // scrollDirection: Axis.horizontal,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return  InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider.value(
                  value: BlocProvider.of<HomeCubit>(contextF)
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
                Image.network(products[index].image!,height: 123.h,width: 131.w,),
                SizedBox(height: 4.h,),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  products[index].title!,style: GoogleFonts.plusJakartaSans(textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryText
                )),),
                SizedBox(height: 4.h,),
                Text("\$${products[index].price!}",style: GoogleFonts.plusJakartaSans(textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.loginRegisterTextButton,
                )),),
              ],
            ),
          ),
        );
      },
    ),
  );
}
Widget buildError2() {
  return Center(child: Text("Error"));
}
Widget buildLoading2() {
  return Center(child: CircularProgressIndicator());
}