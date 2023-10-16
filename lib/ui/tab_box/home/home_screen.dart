import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/category_items.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/custom_sliver_app_bar.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/custom_sliver_grid_item.dart';

import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(controller: searchController,),
          const CategoryItems(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.h,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: 0.65.h,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const CustomSliverGridItem(
                      image: AppImages.cappucino,
                      name: "Cappucino",
                      desc: "with Chocolate",
                      price: "\$ 4.53");
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
