class ProductModelFields {
  static const categoryId = "categoryId";
  static const name = "name";
  static const id = "id";
  static const photoUrl = "photoUrl";
  static const description = "description";
  static const price = "price";
  static const productId = "productId";
  static const count = "count";

  static const tableName = "products";
  static const favorites = "favorites";
}

class ProductModelForSql {
  final int? id;
  final String productId;
  final int count;
  final String name;
  final double price;
  final String photoUrl;
  final String categoryId;
  final String description;

  ProductModelForSql(
      {this.id,
      required this.categoryId,
      required this.count,
      required this.photoUrl,
      required this.description,
      required this.name,
      required this.price,
      required this.productId});

  factory ProductModelForSql.fromJson(Map<String, dynamic> json) {
    return ProductModelForSql(
      id: json[ProductModelFields.id] ?? 0,
      productId: json[ProductModelFields.productId] as String? ?? '',
      count: json[ProductModelFields.count] as int? ?? 0,
      name: json[ProductModelFields.name] as String? ?? "",
      price: json[ProductModelFields.price] as double? ?? 0,
      photoUrl: json[ProductModelFields.photoUrl] as String? ?? "",
      categoryId: json[ProductModelFields.categoryId] as String? ?? "",
      description: json[ProductModelFields.description] as String? ?? "",
    );
  }

  ProductModelForSql copyWith({
    String? name,
    int? id,
    String? productId,
    int? count,
    double? price,
    String? photoUrl,
    String? description,
    String? categoryId,
  }) {
    return ProductModelForSql(
      name: name ?? this.name,
      productId: productId ?? this.productId,
      count: count ?? this.count,
      price: price ?? this.price,
      photoUrl: photoUrl ?? this.photoUrl,
      id: id ?? this.id,
      categoryId:  categoryId ?? this.categoryId,
      description:  description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductModelFields.name: name,
      ProductModelFields.id: id,
      ProductModelFields.price: price,
      ProductModelFields.count: count,
      ProductModelFields.productId: productId,
      ProductModelFields.photoUrl: photoUrl,
      ProductModelFields.categoryId: categoryId,
      ProductModelFields.description: description,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      productId: $productId
      price: $price
      count: $count
      photoUrl: $photoUrl
      id: $id, 
      categoryId: $categoryId
      description: $description, 
    ''';
  }
}
