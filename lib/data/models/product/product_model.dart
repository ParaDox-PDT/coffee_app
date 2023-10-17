class ProductModel {
  final String categoryId;
  final String name;
  final String photoUrl;
  final String description;
  final num price;
  final String productId;

  ProductModel(
      {required this.categoryId,
      required this.price,
      required this.name,
      required this.description,
      required this.photoUrl,
      required this.productId,});

  ProductModel copyWith({
    num? price,
    String? photoUrl,
    String? categoryId,
    String? productId,
    String? name,
    int? count,
    String? description,
  }) {
    return ProductModel(
      price: price ?? this.price,
      photoUrl: photoUrl ?? this.photoUrl,
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      price: jsonData['price'] as num? ?? 0,
      photoUrl: (jsonData['photoUrl'] as String? ?? ""),
      categoryId: jsonData['categoryId'] as String? ?? '',
      productId: jsonData['productId'] as String? ?? '',
      name: jsonData['name'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'photoUrl': photoUrl,
      'categoryId': categoryId,
      'productId': productId,
      'name': name,
      'description': description
    };
  }

  @override
  String toString() {
    return '''
      price: $price,
      photoUrl: $photoUrl,
      categoryId: $categoryId,
      productId: $productId,
      name: $name,
      description: $description,
      ''';
  }
}
