import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/bloc/order/order_bloc.dart';
import 'package:paradoxs_coffee/bloc/product/product_bloc.dart';
import 'package:paradoxs_coffee/data/local/storage_repository/storage_repository.dart';
import 'package:paradoxs_coffee/data/models/order/form_status_order.dart';
import 'package:paradoxs_coffee/data/models/order/order_model.dart';
import 'package:paradoxs_coffee/data/models/product/product_model_for_sql.dart';

import 'package:paradoxs_coffee/ui/tab_box/order/widgets/order_app_bar.dart';
import 'package:paradoxs_coffee/ui/tab_box/order/widgets/order_text_field.dart';
import 'package:paradoxs_coffee/ui/tab_box/order/widgets/row_item_button.dart';
import 'package:paradoxs_coffee/ui/widgets/global_button.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/extension.dart';
import 'package:paradoxs_coffee/utils/icons.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<ProductModelForSql> products = [];
  double sum = 0;
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  _init() async {
    Future.microtask(() {
      BlocProvider.of<ProductBloc>(context).add(GetAllProductsEvent());
    });
  }

  checkSum() {
    for (var element in products) {
      sum += element.count * element.price;
    }
    setState(() {
      sum.floor();
    });
  }

  @override
  void initState() {
    _init();
    products = BlocProvider.of<ProductBloc>(context).productsSql;
    checkSum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrderAppBar(),
      body: BlocConsumer<ProductBloc, ProductState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...List.generate(products.length, (index) {
                      ProductModelForSql productModel = products[index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 24.w),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: CachedNetworkImage(
                                imageUrl: productModel.photoUrl,
                                width: 54.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            12.pw,
                            RichText(
                              text: TextSpan(
                                text: "${productModel.name}\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.c_2F2D2C),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RowItemButton(
                                    icon: AppIcons.minus,
                                    onTap: () {
                                      if (productModel.count > 1) {
                                        context.read<ProductBloc>().add(
                                              DecrementProductEvent(
                                                  id: productModel.id!),
                                            );
                                        setState(() {
                                          sum = 0;
                                          checkSum();
                                        });
                                      } else {
                                        context.read<ProductBloc>().add(
                                            DeleteProductEvent(
                                                id: productModel.id!));
                                      }
                                    },
                                  ),
                                  8.pw,
                                  Text(
                                    productModel.count.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(color: Colors.black),
                                  ),
                                  8.pw,
                                  RowItemButton(
                                    icon: AppIcons.plus2,
                                    onTap: () {
                                      context.read<ProductBloc>().add(
                                            IncrementProductEvent(
                                                id: productModel.id!),
                                          );
                                      setState(() {
                                        sum = 0;
                                        checkSum();
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    const Divider(
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
                          "\$ ${(sum).toString().substring(0, sum.toString().indexOf(".") + 2)}",
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
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppColors.c_2F2D2C,
                                  ),
                        ),
                      ],
                    ),
                    16.ph,
                    const Divider(
                      thickness: 1,
                    ),
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
                          "\$ ${(sum + 1).toString().substring(0, (sum + 1).toString().indexOf(".") + 2)}",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
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
                child: GlobalButton(
                    text: "Order",
                    onTap: () {
                      if (products.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actionsPadding: const EdgeInsets.symmetric(vertical: 0),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      if (phoneController.text.isNotEmpty &&
                                          addressController.text.isNotEmpty) {
                                        context
                                            .read<OrderBloc>()
                                            .add(AddOrderEvent(
                                              orderModel: OrderModel(
                                                createdAt:
                                                    DateTime.now().toString(),
                                                address: addressController.text,
                                                comment: commentController.text,
                                                phoneNumber:
                                                    phoneController.text,
                                                products: [
                                                  ...List.generate(
                                                      products.length,
                                                      (index) => {
                                                            "productId":
                                                                products[index]
                                                                    .productId,
                                                            "count":
                                                                products[index]
                                                                    .count
                                                          })
                                                ],
                                                totalPrice: sum,
                                                username:
                                                    usernameController.text,
                                                status: FormStatusOrder.pure,
                                                userId:
                                                    StorageRepository.getString(
                                                        "userId"),
                                              ),
                                            ));
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Successfully Ordered!!!Thank You "),
                                        ));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Address and Phone number required"),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text("Order"))
                              ],
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    OrderTextField(
                                        controller: usernameController,
                                        hintText: "User name"),
                                    12.ph,
                                    OrderTextField(
                                        controller: phoneController,
                                        hintText: "Phone number"),
                                    12.ph,
                                    OrderTextField(
                                        controller: addressController,
                                        hintText: "Address"),
                                    12.ph,
                                    OrderTextField(
                                        controller: commentController,
                                        hintText: "Comment")
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Cart is Empty! Please Buy Coffee"),
                        ));
                      }
                    }),
              )
            ],
          );
        },
        listener: (context, state) {
          if (state is ProductUpdateState) {
            setState(() {
              BlocProvider.of<ProductBloc>(context).add(GetAllProductsEvent());
              products = BlocProvider.of<ProductBloc>(context).productsSql;
            });
          }
        },
      ),
    );
  }
}
