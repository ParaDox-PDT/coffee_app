import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paradoxs_coffee/data/local/db/local_database.dart';
import 'package:paradoxs_coffee/data/models/product/product_model.dart';
import 'package:paradoxs_coffee/data/models/product/product_model_for_sql.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductsEvent>(listenProducts);
    on<GetAllProductsEvent>(getAllProducts);
    on<AddProductEvent>(addProduct);
    on<DeleteProductEvent>(deleteProduct);
    on<DeleteAllProductsEvent>(deleteAllProduct);
    on<DecrementProductEvent>(decrementProduct);
    on<IncrementProductEvent>(incrementProduct);
    on<CheckProductEvent>(checkProduct);
    on<ChangeCateIdProductsEvent>(changeCategoryId);
    on<UpdateEvent>(update);
  }

  List<ProductModelForSql> productsSql=[];
  String searchText='';
  List<ProductModel> products=[];
  String categoryId = "";

  changeCategoryId(ChangeCateIdProductsEvent event, Emitter<ProductState> emit){
    categoryId=event.cateId;
    emit(ProductUpdateState());
    emit(ProductInitial());
  }

  update(UpdateEvent event, Emitter<ProductState> emit){
    emit(ProductUpdateState());
    emit(ProductInitial());
  }

  Future<void> addProduct(AddProductEvent event,Emitter<ProductState> emit)async{
    try{
      emit(ProductLoadingState());
      await LocalDatabase.insertProduct(event.productModelForSql);
      emit(ProductUpdateState());
    }catch(e){
      emit(ProductErrorState(errorText: e.toString()));
    }
    emit(ProductInitial());
  }

  Future<void> deleteProduct(DeleteProductEvent event,Emitter<ProductState> emit)async{
    try{
      emit(ProductLoadingState());
      await LocalDatabase.deleteProduct(event.id);
      emit(ProductUpdateState());
    }catch(e){
      emit(ProductErrorState(errorText: e.toString()));
    }
    emit(ProductInitial());
  }

  Future<void> decrementProduct(DecrementProductEvent event,Emitter<ProductState> emit)async{
    try{
      emit(ProductLoadingState());
      await LocalDatabase.decrementProduct(id: event.id);
      emit(ProductUpdateState());
    }catch(e){
      emit(ProductErrorState(errorText: e.toString()));
    }
    emit(ProductInitial());
  }

  Future<void> incrementProduct(IncrementProductEvent event,Emitter<ProductState> emit)async{
    try{
      emit(ProductLoadingState());
      await LocalDatabase.decrementProduct(id: event.id);
      emit(ProductUpdateState());
    }catch(e){
      emit(ProductErrorState(errorText: e.toString()));
    }
    emit(ProductInitial());
  }

  Future<void> checkProduct(CheckProductEvent event,Emitter<ProductState> emit)async{
    try{
      emit(ProductLoadingState());
      await LocalDatabase.checkProduct(id: event.id);
      emit(ProductUpdateState());
    }catch(e){
      emit(ProductErrorState(errorText: e.toString()));
    }
    emit(ProductInitial());
  }

  Future<void> getAllProducts(GetAllProductsEvent event,Emitter<ProductState> emit)async{
    try{
      emit(ProductLoadingState());
      productsSql=await LocalDatabase.getAllProducts();
      emit(ProductUpdateState());
    }catch(e){
      emit(ProductErrorState(errorText: e.toString()));
    }
    emit(ProductInitial());
  }

  Future<void> deleteAllProduct(DeleteAllProductsEvent event,Emitter<ProductState> emit)async{
    try{
      emit(ProductLoadingState());
      await LocalDatabase.deleteAllProducts();
      emit(ProductUpdateState());
    }catch(e){
      emit(ProductErrorState(errorText: e.toString()));
    }
    emit(ProductInitial());
  }

  Stream<List<ProductModel>> getProducts() async* {
    if (categoryId.isEmpty) {
      yield* FirebaseFirestore.instance.collection("products").snapshots().map(
            (event1) => event1.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList(),
      );
    } else {
      yield* FirebaseFirestore.instance
          .collection("products")
          .where("categoryId", isEqualTo:categoryId)
          .snapshots()
          .map(
            (event1) => event1.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList(),
      );
    }
  }

  listenProducts(GetProductsEvent event, Emitter<ProductState> emit)async{
    emit(ProductLoadingState());
    getProducts().listen((List<ProductModel> product) {
      products = product;
      debugPrint("CURRENT USER ORDERS LENGTH:${products.length}");
    });
    emit(ProductUpdateState());
  }

}
