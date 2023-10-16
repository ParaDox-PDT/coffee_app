import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paradoxs_coffee/data/local/db/local_database.dart';
import 'package:paradoxs_coffee/data/models/product/product_model_for_sql.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<GetAllProductsFavoritesEvent>(getAllFavorites);
    on<GetAllProductsIdFavoritesEvent>(getAllFavoritesId);
    on<AddProductFavoritesEvent>(addFavorite);
    on<DeleteProductFavoritesEvent>(deleteFavorite);
  }

  List<ProductModelForSql> favorites = [];
  List<String> favoritesId = [];

  Future<void> getAllFavorites(
      GetAllProductsFavoritesEvent event, Emitter<FavoritesState> emit) async {
    try {
      emit(FavoritesLoadingState());
      favorites = await LocalDatabase.getAllFavorites();
      emit(FavoritesUpdateState());
    } catch (e) {
      emit(FavoritesErrorState(errorText: e.toString()));
    }
    emit(FavoritesInitial());
  }

  Future<void> getAllFavoritesId(GetAllProductsIdFavoritesEvent event,
      Emitter<FavoritesState> emit) async {
    try {
      emit(FavoritesLoadingState());
      favoritesId = await LocalDatabase.getAllFavoritesId();
      emit(FavoritesUpdateState());
    } catch (e) {
      emit(FavoritesErrorState(errorText: e.toString()));
    }
    emit(FavoritesInitial());
  }

  Future<void> addFavorite(
      AddProductFavoritesEvent event, Emitter<FavoritesState> emit) async {
    try {
      emit(FavoritesLoadingState());
      await LocalDatabase.insertProductToFavorites(event.productModelForSql);
      emit(FavoritesUpdateState());
    } catch (e) {
      emit(FavoritesErrorState(errorText: e.toString()));
    }
    emit(FavoritesInitial());
  }

  Future<void> deleteFavorite(
      DeleteProductFavoritesEvent event, Emitter<FavoritesState> emit) async {
    try {
      emit(FavoritesLoadingState());
      await LocalDatabase.deleteProductFromFavorites(event.id);
      emit(FavoritesUpdateState());
    } catch (e) {
      emit(FavoritesErrorState(errorText: e.toString()));
    }
    emit(FavoritesInitial());
  }
}
