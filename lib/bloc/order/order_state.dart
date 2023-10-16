part of 'order_bloc.dart';


abstract class OrderState extends Equatable {}

class OrderInitial extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderUpdateState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoadingState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderAddSuccessState extends OrderState {
  @override
  List<Object?> get props => [];
}
class OrderDeleteSuccessState extends OrderState {
  @override
  List<Object?> get props => [];
}
class OrderErrorState extends OrderState {
  final String errorText;
  OrderErrorState({required this.errorText});
  @override
  List<Object?> get props => [];
}