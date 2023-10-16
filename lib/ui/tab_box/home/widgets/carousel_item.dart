import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem(
      {super.key,
      required this.text,
      required this.title,
      required this.image});

  final String text;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.c_ED5151),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          12.ph,
          Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.4),
                fontSize: 32.sp,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
