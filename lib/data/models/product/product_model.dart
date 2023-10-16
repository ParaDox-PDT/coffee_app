class ProductModel {
  final String categoryId;
  final String name;
  final String photoUrl;
  final String description;
  final double price;
  final String productId;
  final int count;

  ProductModel(
      {required this.categoryId,
      required this.price,
      required this.name,
      required this.description,
      required this.photoUrl,
      required this.productId,
      required this.count});

  ProductModel copyWith({
    double? price,
    String? photoUrl,
    String? categoryId,
    String? productId,
    String? name,
    int? count,
    String? description,
  }) {
    return ProductModel(
      price: price ?? this.price,
      count: count ?? this.count,
      photoUrl: photoUrl ?? this.photoUrl,
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      count: jsonData['count'] as int? ?? 0,
      price: jsonData['price'] as double? ?? 0,
      photoUrl: (jsonData['photoUrl'] as String? ?? ""),
      categoryId: jsonData['categoryId'] as String? ?? '',
      productId: jsonData['productId'] as String? ?? '',
      name: jsonData['name'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count':count,
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
      count: $count,
      price: $price,
      photoUrl: $photoUrl,
      categoryId: $categoryId,
      productId: $productId,
      name: $name,
      description: $description,
      ''';
  }
}
