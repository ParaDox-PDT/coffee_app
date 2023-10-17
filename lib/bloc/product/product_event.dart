part of 'product_bloc.dart';


abstract class ProductEvent extends Equatable{}

class GetProductsEvent extends ProductEvent{
  @override
  List<Object?> get props => [];

}

class AddProductEvent extends ProductEvent{
  final ProductModelForSql productModelForSql;
  AddProductEvent({required this.productModelForSql});

  @override
  List<Object?> get props => [productModelForSql];

}

class DeleteProductEvent extends ProductEvent{
  final int id;
  DeleteProductEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class IncrementProductEvent extends ProductEvent{
  final int id;
  IncrementProductEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class DecrementProductEvent extends ProductEvent{
  final int id;
  DecrementProductEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class CheckProductEvent extends ProductEvent{
  final int id;
  CheckProductEvent({required this.id});
  @override
  List<Object?> get props => [id];
}



class GetAllProductsEvent extends ProductEvent{
  @override
  List<Object?> get props => [];
}

class DeleteAllProductsEvent extends ProductEvent{
  @override
  List<Object?> get props => [];
}


class ChangeCateIdProductsEvent extends ProductEvent{
  final String cateId;
  ChangeCateIdProductsEvent({required this.cateId});
  @override
  List<Object?> get props => [cateId];
}

class UpdateEvent extends ProductEvent{
  @override
  List<Object?> get props => [];
}

class FilterListEvent extends ProductEvent{
  final int filterNumber;
  FilterListEvent({required this.filterNumber});

  @override
  List<Object?> get props => [filterNumber];
}