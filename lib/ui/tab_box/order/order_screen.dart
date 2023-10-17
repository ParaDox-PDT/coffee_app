import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lottie/lottie.dart';
import 'package:paradoxs_coffee/bloc/order/order_bloc.dart';
import 'package:paradoxs_coffee/data/models/order/order_model.dart';

import 'package:paradoxs_coffee/ui/tab_box/order/widgets/order_app_bar.dart';
import 'package:paradoxs_coffee/utils/images.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrderAppBar(),
      body: StreamBuilder<List<OrderModel>>(
        stream: context.read<OrderBloc>().listenOrdersList(null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<OrderModel> orders = [];
            orders = snapshot.data!;
            return orders.isNotEmpty
                ? ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...List.generate(
                        orders.length,
                        (index) => ListTile(
                          title: Text(
                            orders[index].username,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          subtitle: Text(orders[index].phoneNumber),
                          trailing: Text("Total Price: \$ ${orders[index].totalPrice.toInt()}"),
                        ),
                      )
                    ],
                  )
                : SliverToBoxAdapter(
                    child: Center(
                      child: Lottie.asset(AppImages.empty),
                    ),
                  );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(
            child: Lottie.asset(AppImages.loadingFBG),
          );
        },
      ),
    );
  }
}
