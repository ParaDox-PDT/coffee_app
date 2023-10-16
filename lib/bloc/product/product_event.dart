part of 'product_bloc.dart';


abstract class ProductEvent extends Equatable{}

class GetProductsEvent extends ProductEvent{
  final String categoryId;
  GetProductsEvent({required this.categoryId});

  @override
  List<Object?> get props => [];

}
