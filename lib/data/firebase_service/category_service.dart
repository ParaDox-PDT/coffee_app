import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paradoxs_coffee/data/models/category/category_model.dart';
import 'package:paradoxs_coffee/data/models/universal_data.dart';

class CategoryService{
  Future<UniversalData> addCategory({required CategoryModel categoryModel}) async {
    try {
      DocumentReference newCategory = await FirebaseFirestore.instance
          .collection("category")
          .add(categoryModel.toJson());

      await FirebaseFirestore.instance
          .collection("category")
          .doc(newCategory.id)
          .update({"categoryId": newCategory.id});

      return UniversalData(data: "Category added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

}