import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Search coffee",
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        fillColor: AppColors.c_313131,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h),
        prefixIcon: Padding(
          padding: EdgeInsets.all(16.w),
          child: SvgPicture.asset(
            AppIcons.search,
            width: 20.w,
          ),
        ),
        suffixIcon: ZoomTapAnimation(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 6.h),

                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(child: const Text("Max Price",style: TextStyle(color: Colors.black)),onPressed: (){Navigator.pop(context);},),
                    TextButton(child: const Text("Min Price",style: TextStyle(color: Colors.black)),onPressed: (){Navigator.pop(context);},),
                  ],
                ),
              ),
            );
          },
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
            borderSide: BorderSide(width: 1.w, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.c_313131)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.c_313131)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.c_313131)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.c_C67C4E)),
      ),
    );
  }
}
