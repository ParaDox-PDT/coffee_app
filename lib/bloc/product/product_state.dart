part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}
//
// class ProductSuccessState extends ProductState{
//   @override
//   List<Object?> get props => [];
// }

class ProductUpdateState extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductCheckSumState extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductErrorState extends ProductState{
  final String errorText;
  ProductErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}

