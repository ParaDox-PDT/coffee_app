part of 'category_bloc.dart';

abstract class CategoryState extends Equatable{}

class CategoryInitial extends CategoryState {
  @override

  List<Object?> get props => [];
}
class CategoryUpdateState extends CategoryState {
  @override

  List<Object?> get props => [];
}
class CategoryLoadingState extends CategoryState {
  @override

  List<Object?> get props => [];
}

class CategoryError extends CategoryState {
  final String errorText;
  CategoryError({required this.errorText});
  @override

  List<Object?> get props => [errorText];
}