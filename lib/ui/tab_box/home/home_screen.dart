import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paradoxs_coffee/bloc/product/product_bloc.dart';
import 'package:paradoxs_coffee/data/models/product/product_model.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/category_items.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/custom_sliver_app_bar.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/widgets/custom_sliver_grid_item.dart';

import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            controller: searchController,
          ),
          const CategoryItems(),
          BlocConsumer<ProductBloc, ProductState>(
            builder: (context, state) {
              return StreamBuilder<List<ProductModel>>(
                stream: context.read<ProductBloc>().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = [];
                    if (searchController.text.isNotEmpty) {
                      for (var element in snapshot.data!) {
                        if (element.name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          products.add(element);
                        }
                      }
                      if (context.read<ProductBloc>().filterList == 2) {
                        products.sort(
                          (a, b) => a.price.compareTo(b.price),
                        );
                      } else if (context.read<ProductBloc>().filterList == 1) {
                        products.sort(
                          (b, a) => a.price.compareTo(b.price),
                        );
                      }
                    } else {
                      products = snapshot.data!;
                      if (context.read<ProductBloc>().filterList == 2) {
                        products.sort(
                          (a, b) => a.price.compareTo(b.price),
                        );
                      } else if (context.read<ProductBloc>().filterList == 1) {
                        products.sort(
                          (b, a) => a.price.compareTo(b.price),
                        );
                      }
                    }
                    return products.isNotEmpty
                        ? SliverPadding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 16.h),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200.h,
                                mainAxisSpacing: 20.h,
                                crossAxisSpacing: 20.w,
                                childAspectRatio: 0.65.h,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  ProductModel productModel = products[index];
                                  return CustomSliverGridItem(
                                      productModel: productModel);
                                },
                                childCount: products.length,
                              ),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: Center(
                              child: Lottie.asset(AppImages.empty),
                            ),
                          );
                  }
                  if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(snapshot.error.toString()),
                      ),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Lottie.asset(AppImages.loadingFBG),
                    ),
                  );
                },
              );
            },
            listener: (context, state) {
              if (state is ProductUpdateState) {
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}
