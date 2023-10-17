import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/icons.dart';

class DetailAppBar extends StatelessWidget implements PreferredSize{
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      leading: IconButton(
        splashRadius: 20.r,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          AppIcons.arrowLeft,
          width: 20.w,
        ),
      ),
      title: Text(
        "Detail",
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
