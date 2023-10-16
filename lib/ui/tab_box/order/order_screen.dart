import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:paradoxs_coffee/ui/tab_box/order/widgets/order_app_bar.dart';
import 'package:paradoxs_coffee/ui/tab_box/order/widgets/row_item_button.dart';
import 'package:paradoxs_coffee/ui/widgets/global_button.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';
import 'package:paradoxs_coffee/utils/icons.dart';
import 'package:paradoxs_coffee/utils/images.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrderAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ...List.generate(8, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h,horizontal: 24.w),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.cappucino,
                          width: 54.w,
                          fit: BoxFit.cover,
                        ),
                        12.pw,
                        RichText(
                          text: TextSpan(
                            text: "Cappucino\n",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.c_2F2D2C),
                            children: [
                              TextSpan(
                                  text: "with Chocolate",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RowItemButton(icon: AppIcons.minus, onTap: () {}),
                              8.pw,
                              Text(
                                "1",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.black),
                              ),
                              8.pw,
                              RowItemButton(icon: AppIcons.plus2, onTap: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
                Divider(
                  thickness: 4,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Summary",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.c_2F2D2C, fontSize: 20.sp),
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.c_2F2D2C),
                    ),
                    Text(
                      "\$ 4.53",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.c_2F2D2C),
                    ),
                  ],
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Free",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.c_2F2D2C),
                    ),
                    Text(
                      "\$ 1",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppColors.c_2F2D2C,
                          ),
                    ),
                  ],
                ),
                16.ph,
                Divider(thickness: 1,),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.c_2F2D2C),
                    ),
                    Text(
                      "\$ 5.53",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColors.c_2F2D2C,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: GlobalButton(text: "Order", onTap: () {}),
          )
        ],
      ),
    );
  }
}
