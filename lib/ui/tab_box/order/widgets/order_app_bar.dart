import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:paradoxs_coffee/utils/colors.dart';



class OrderAppBar extends StatelessWidget implements PreferredSize{
  const OrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: AppColors.white,
      title: Text(
        "Order",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.c_2F2D2C, fontSize: 18.sp),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget get child =>const SizedBox() ;

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
