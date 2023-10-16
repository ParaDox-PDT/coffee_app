import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DetailSizes extends StatefulWidget {
  const DetailSizes({super.key});

  @override
  State<DetailSizes> createState() => _DetailSizesState();
}

class _DetailSizesState extends State<DetailSizes> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ZoomTapAnimation(
            onTap: (){
              setState(() {
                currentIndex=0;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(width: 1,color: AppColors.c_DEDEDE),
              ),
              child: Center(
                child: Text("S",style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 14.sp,color: AppColors.c_2F2D2C),),
              ),
            ),
          ),
        ),
        12.pw,
        Expanded(
          child: ZoomTapAnimation(
            onTap: (){
              setState(() {
                currentIndex=1;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(width: 1,color: AppColors.c_C67C4E),
                  color: AppColors.c_FFF5EE
              ),
              child: Center(
                child: Text("M",style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 14.sp,color: AppColors.c_C67C4E),),
              ),
            ),
          ),
        ),
        12.pw,
        Expanded(
          child: ZoomTapAnimation(
            onTap: (){
              setState(() {
                currentIndex=2;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(width: 1,color: AppColors.c_DEDEDE),
              ),
              child: Center(
                child: Text("L",style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 14.sp,color: AppColors.c_2F2D2C),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
