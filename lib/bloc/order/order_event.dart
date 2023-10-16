part of 'order_bloc.dart';


abstract class OrderEvent extends Equatable {}

class AddOrderEvent extends OrderEvent{
  final OrderModel orderModel;
  AddOrderEvent({required this.orderModel});
  @override
  List<Object?> get props => [orderModel];
}

class GetOrderEvent extends OrderEvent{
  final String userId;
  GetOrderEvent({required this.userId});
  @override
  List<Object?> get props => [userId];
}

class UpdateOrderEvent extends OrderEvent{
  final OrderModel newOrderModel;
  UpdateOrderEvent({required this.newOrderModel});
  @override
  List<Object?> get props => [newOrderModel];
}

class DeleteOrderEvent extends OrderEvent{
  final String orderId;
  DeleteOrderEvent({required this.orderId});
  @override
  List<Object?> get props => [orderId];
}


