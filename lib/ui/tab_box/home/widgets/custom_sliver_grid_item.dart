import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paradoxs_coffee/ui/app_routes.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';
import 'package:paradoxs_coffee/utils/icons.dart';
import 'package:paradoxs_coffee/utils/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomSliverGridItem extends StatelessWidget {
  const CustomSliverGridItem({super.key, required this.image, required this.name, required this.desc, required this.price});
  final String image;
  final String name;
  final String desc;
  final String price;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: (){
        Navigator.pushNamed(context, RouteNames.detailScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.white,
            boxShadow: [BoxShadow(spreadRadius: 3,blurRadius: 6,color: Colors.grey,offset: Offset(6.w, 6.h))]
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(image,width: double.infinity,height: 132.h,fit: BoxFit.cover,),
            ),
            12.ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.c_2F2D2C),
                  ),
                  Text(desc,
                      style: Theme.of(context).textTheme.bodySmall),
                  8.ph,
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Sora",
                            fontWeight: FontWeight.w600,
                            color: AppColors.c_2F4B4E),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.w),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10.r),
                            color: AppColors.c_C67C4E),
                        child: SvgPicture.asset(
                          AppIcons.plus,
                          width: 16.w,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
