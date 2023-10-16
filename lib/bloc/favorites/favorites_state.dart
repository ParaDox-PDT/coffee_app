part of 'favorites_bloc.dart';


abstract class FavoritesState extends Equatable {}

class FavoritesInitial extends FavoritesState {
  @override
  List<Object?> get props => [];
}

class FavoritesLoadingState extends FavoritesState{
  @override
  List<Object?> get props => [];
}

class FavoritesUpdateState extends FavoritesState{
  @override
  List<Object?> get props => [];
}

class FavoritesErrorState extends FavoritesState{
  final String errorText;
  FavoritesErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}