import 'package:paradoxs_coffee/data/firebase_service/category_service.dart';
import 'package:paradoxs_coffee/data/models/category/category_model.dart';
import 'package:paradoxs_coffee/data/models/universal_data.dart';

class CategoryRepo{
  final CategoryService categoryService;
  CategoryRepo({required this.categoryService});

  Future<UniversalData> addCategory({required CategoryModel categoryModel})=>categoryService.addCategory(categoryModel: categoryModel);

}