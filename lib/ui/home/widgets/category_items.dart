import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 38.h,
      systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      backgroundColor: AppColors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 30.h,bottom: 8.h,),
          child: SizedBox(
            height: 36.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                  10,
                      (index) => ZoomTapAnimation(
                    onTap: (){},
                    child: Container(
                      height: 20.h,
                      margin: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color:
                        index == 0 ? AppColors.c_C67C4E : AppColors.white,
                        border:
                        Border.all(width: 1.w, color: AppColors.c_C67C4E),
                      ),
                      child: Center(
                        child: Text("Cappuccino",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: index==0?AppColors.white:AppColors.c_2F4B4E),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
