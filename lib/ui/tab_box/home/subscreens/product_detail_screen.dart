import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/subscreens/widgets/detail_app_bar.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';
import 'package:paradoxs_coffee/utils/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const BouncingScrollPhysics(),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    AppImages.cappucino,
                    height: 226.h,
                    fit: BoxFit.cover,
                  ),
                ),
                20.ph,
                Text(
                  "Cappucino",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.c_2F2D2C, fontSize: 20.sp),
                ),
                8.ph,
                Text("with Chocolate",
                    style: Theme.of(context).textTheme.bodySmall),
                20.ph,
                Divider(
                  thickness: 1.sp,
                ),
                20.ph,
                Text(
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.c_2F2D2C, fontSize: 20.sp),
                ),
                12.ph,
                Text(
                  "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14.sp),
                ),
                20.ph,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 12.h),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Price\n",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16.sp),
                    children: [
                      TextSpan(
                          text: "\$ 4.53",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 18.sp, color: AppColors.c_C67C4E))
                    ],
                  ),
                ),
                40.pw,
                Expanded(
                  child: ZoomTapAnimation(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 22.h,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.c_C67C4E),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}