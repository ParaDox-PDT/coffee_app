part of 'favorites_bloc.dart';


abstract class FavoritesEvent extends Equatable{}


class GetAllProductsFavoritesEvent extends FavoritesEvent{
  @override
  List<Object?> get props => [];
}

class GetAllProductsIdFavoritesEvent extends FavoritesEvent{
  @override
  List<Object?> get props => [];
}

class AddProductFavoritesEvent extends FavoritesEvent{
  final ProductModelForSql productModelForSql;
  AddProductFavoritesEvent({required this.productModelForSql});

  @override
  List<Object?> get props => [productModelForSql];

}

class DeleteProductFavoritesEvent extends FavoritesEvent{
  final int id;
  DeleteProductFavoritesEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

