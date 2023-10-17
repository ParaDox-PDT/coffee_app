import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paradoxs_coffee/data/models/category/category_model.dart';
import 'package:paradoxs_coffee/data/models/universal_data.dart';
import 'package:paradoxs_coffee/data/repositories/category_repo/category_repo.dart';


part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.categoryRepo}) : super(CategoryInitial()){
    on<CategoryAddEvent>(addCategory);
  }
  final CategoryRepo categoryRepo;

  addCategory(CategoryAddEvent event,Emitter<CategoryState> emit)async{
    emit(CategoryLoadingState());
    UniversalData universalData = await categoryRepo.addCategory(categoryModel: event.categoryModel);
    if(universalData.error.isEmpty){
      emit(CategoryUpdateState());
    }else{
      emit(CategoryError(errorText: universalData.error));
    }
    emit(CategoryInitial());
  }

  Stream<List<CategoryModel>> getCategories() =>
      FirebaseFirestore.instance.collection("category").snapshots().map(
            (event1) => event1.docs
            .map((doc) => CategoryModel.fromJson(doc.data()))
            .toList(),
      );
}
