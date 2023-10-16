import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paradoxs_coffee/utils/colors.dart';


class RowItemButton extends StatelessWidget {
  const RowItemButton({super.key, required this.icon, required this.onTap});
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return   Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(100.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 6.w, vertical: 6.h),
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(100.r),
              border: Border.all(
                  width: 1, color: AppColors.c_EAEAEA)),
          child: Center(
            child: SvgPicture.asset(icon,width: 16.w,),
          ),
        ),
      ),
    );
  }
}
