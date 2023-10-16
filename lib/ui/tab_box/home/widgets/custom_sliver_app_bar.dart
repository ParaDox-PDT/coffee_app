import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/carousel_item.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/search_text_field.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';
import 'package:paradoxs_coffee/utils/images.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: false,
      expandedHeight: 260.h,
      backgroundColor: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:
          Color.lerp(AppColors.c_313131, AppColors.c_131313, 0.6),
          statusBarIconBrightness: Brightness.light),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200.h,
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [AppColors.c_131313, AppColors.c_313131],
                    ),
                  ),
                ),
                Container(
                  height: 70.h,
                  color: AppColors.white,
                ),
              ],
            ),
            Column(
              children: [
                48.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: SearchTextField(controller:widget.controller),
                ),
                24.ph,
                FlutterCarousel(
                  items: const [
                    CarouselItem(
                        text: "Buy one get one FREE",
                        title: "Discount",
                        image: AppImages.promo),
                    CarouselItem(
                        text: "Start your day with hot coffee",
                        title: "Mood",
                        image: AppImages.mood),
                    CarouselItem(
                        text: "Delivery service throughout the city",
                        title: "Service",
                        image: AppImages.delivery),
                  ],
                  options: CarouselOptions(
                      height: 150.h,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      enableInfiniteScroll: true),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
