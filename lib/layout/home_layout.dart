import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/feature/cart/presentation/cart_screen.dart';
import 'package:final_project/feature/home/presentation/main_screen.dart';
import 'package:final_project/feature/home/presentation/notification_screen.dart';
import 'package:final_project/feature/home/presentation/wishlist_screen.dart';
import 'package:final_project/feature/profile/presentation/profile_screen.dart';
import 'package:final_project/feature/search/presentation/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key,});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  bool isSelected = false;

  List<Widget> pages = [MainScreen(), SearchScreen(),WishlistScreen(),CartScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        elevation: 2,
        shadowColor: Colors.black,
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        onDestinationSelected:
            (index) => setState(() {
              this.index = index;
            }),
        selectedIndex: index,
        height: 68.h,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              CupertinoIcons.house_alt_fill,
              color: AppColor.selectedNav,
            ),
            icon: Icon(CupertinoIcons.house_alt, color: AppColor.unselectedNav),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              CupertinoIcons.search,
              color: AppColor.selectedNav,
            ),
            icon: Icon(CupertinoIcons.search, color: AppColor.unselectedNav),
            label:"Search",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.heart,color: AppColor.selectedNav,),
            icon: Icon(CupertinoIcons.heart,color: AppColor.unselectedNav,),
            label: "Wishlist",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_bag,color: AppColor.selectedNav,),
            icon: Icon(Icons.shopping_bag_outlined,color: AppColor.unselectedNav,),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person_fill,color: AppColor.selectedNav,),
            icon: Icon(CupertinoIcons.person,color: AppColor.unselectedNav,),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
