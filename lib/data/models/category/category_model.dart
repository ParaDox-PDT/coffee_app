class CategoryModel{
  final String categoryId;
  final String categoryName;

  CategoryModel({ required this.categoryId, required this.categoryName});

  CategoryModel copyWith({
    String? categoryId,
    String? categoryName,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      categoryId: jsonData['categoryId'] as String? ?? "",
      categoryName: jsonData['categoryName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName
    };
  }

  @override
  String toString() {
    return ''''
       categoryId : $categoryId,
       categoryName : $categoryName,
      ''';
  }
}