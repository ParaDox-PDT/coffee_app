import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paradoxs_coffee/data/firebase_service/order_service.dart';
import 'package:paradoxs_coffee/data/models/order/order_model.dart';
import 'package:paradoxs_coffee/data/models/universal_data.dart';



part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {

  OrderBloc({required this.orderService}) : super(OrderInitial()) {
    on<AddOrderEvent>(addOrder);
    on<DeleteOrderEvent>(deleteOrder);
    on<GetOrderEvent>(listenOrders);
  }

  final OrderService orderService;
  List<OrderModel> userOrders=[];

  Future<void> addOrder(AddOrderEvent event,Emitter<OrderState> emit)async{
    emit(OrderLoadingState());
    UniversalData universalData  = await orderService.addOrder(orderModel: event.orderModel);
    if(universalData.error.isNotEmpty){
      emit(OrderErrorState(errorText: universalData.error));
    }
    if(universalData.error.isEmpty){
      emit(OrderAddSuccessState());
    }
    emit(OrderInitial());
  }

  Future<void> deleteOrder(DeleteOrderEvent event,Emitter<OrderState> emit)async{
    emit(OrderLoadingState());
    UniversalData universalData = await orderService.deleteOrder(orderId: event.orderId);
    if(universalData.error.isNotEmpty){
      emit(OrderErrorState(errorText: universalData.error));
    }
    if(universalData.error.isEmpty){
      emit(OrderDeleteSuccessState());
    }
    emit(OrderInitial());
  }

  Stream<List<OrderModel>> listenOrdersList(String? userId) async* {
    if (userId == null) {
      yield* FirebaseFirestore.instance.collection("orders").snapshots().map(
            (event1) => event1.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList(),
      );
    } else {
      yield* FirebaseFirestore.instance
          .collection("orders")
          .where("userId", isEqualTo: userId)
          .snapshots()
          .map(
            (event1) => event1.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList(),
      );
    }
  }


  listenOrders(GetOrderEvent event,Emitter<OrderState> emit) async {
    listenOrdersList(event.userId).listen((List<OrderModel> orders) {
      userOrders = orders;
      debugPrint("CURRENT USER ORDERS LENGTH:${userOrders.length}");
      emit(OrderUpdateState());
      emit(OrderInitial());
    });
  }
}
