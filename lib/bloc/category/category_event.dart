part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable{}

class CategoryAddEvent extends CategoryEvent{
  final CategoryModel categoryModel;
  CategoryAddEvent({required this.categoryModel});
  @override
  List<Object?> get props => [categoryModel];
}
