import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/bloc/category/category_bloc.dart';
import 'package:paradoxs_coffee/bloc/product/product_bloc.dart';
import 'package:paradoxs_coffee/data/models/category/category_model.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  late String categoryId;
  @override
  void initState() {
    categoryId=BlocProvider.of<ProductBloc>(context).categoryId;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 38.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: AppColors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 8.h,
          ),
          child: StreamBuilder<List<CategoryModel>>(
            stream: context.read<CategoryBloc>().getCategories(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CategoryModel>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? SizedBox(
                        height: 36.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ZoomTapAnimation(
                              onTap: () {
                                setState(() {
                                  categoryId = '';
                                  BlocProvider.of<ProductBloc>(context).add(ChangeCateIdProductsEvent(cateId: categoryId));
                                });
                              },
                              child: Container(
                                height: 20.h,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: categoryId.isEmpty
                                      ? AppColors.c_C67C4E
                                      : AppColors.white,
                                  border: Border.all(
                                      width: 1.w, color: AppColors.c_C67C4E),
                                ),
                                child: Center(
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: categoryId.isEmpty
                                          ? AppColors.white
                                          : AppColors.c_2F2D2C,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ...List.generate(
                              snapshot.data!.length,
                              (index) => ZoomTapAnimation(
                                onTap: () {
                                  setState(() {
                                    categoryId =
                                        snapshot.data![index].categoryId;
                                    BlocProvider.of<ProductBloc>(context).add(ChangeCateIdProductsEvent(cateId: categoryId));
                                  });
                                },
                                child: Container(
                                  height: 20.h,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: categoryId ==
                                            snapshot.data![index].categoryId
                                        ? AppColors.c_C67C4E
                                        : AppColors.white,
                                    border: Border.all(
                                        width: 1.w, color: AppColors.c_C67C4E),
                                  ),
                                  child: Center(
                                    child: Text(
                                      snapshot.data![index].categoryName,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: categoryId ==
                                                snapshot.data![index].categoryId
                                            ? AppColors.white
                                            : AppColors.c_2F2D2C,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : const Center(
                        child: Text("Empty"),
                      );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
