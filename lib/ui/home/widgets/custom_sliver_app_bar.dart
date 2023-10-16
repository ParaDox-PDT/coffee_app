import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paradoxs_coffee/ui/home/widgets/carousel_item.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';
import 'package:paradoxs_coffee/utils/icons.dart';
import 'package:paradoxs_coffee/utils/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key});

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
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search coffee",
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      fillColor: AppColors.c_313131,
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20.h),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: SvgPicture.asset(
                          AppIcons.search,
                          width: 20.w,
                        ),
                      ),
                      suffixIcon: ZoomTapAnimation(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: 44.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.c_C67C4E),
                          child: Center(
                            child: SvgPicture.asset(
                              AppIcons.filter,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                          BorderSide(width: 1.w, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.c_313131)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.c_313131)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.c_313131)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              width: 1.w, color: AppColors.c_C67C4E)),
                    ),
                  ),
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
