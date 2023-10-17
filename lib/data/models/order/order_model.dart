class OrderModel {
  final String address;
  final String comment;
  final String createdAt;
  // final String orderId;
  final String phoneNumber;
  final List<dynamic> products;
  final num totalPrice;
  final String username;
  final String status;
  final String userId;

  OrderModel(
      {required this.createdAt,
      required this.address,
      required this.comment,
      // required this.orderId,
      required this.phoneNumber,
      required this.products,
      required this.totalPrice,
      required this.username,required this.status,required this.userId});

  OrderModel copWith({
    num? totalPrice,
    // String? orderId,
    String? status,
    List<Map<String,dynamic>>? products,
    String? username,
    String? comment,
    String? createdAt,
    String? address,
    String? phoneNumber,
    String? userId,
  }) =>
      OrderModel(
        products: products ?? this.products,
        totalPrice: totalPrice ?? this.totalPrice,
        // orderId: orderId ?? this.orderId,
        status: status ?? this.status,
        username: username ?? this.username,
        comment: comment ?? this.comment,
        address: address ?? this.address,
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        createdAt: createdAt ?? this.createdAt,
      );

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(
      username: jsonData['username'] as String? ?? '',
      totalPrice: jsonData['totalPrice'] as num? ?? 0,
      // orderId: jsonData['orderId'] as String? ?? '',
      comment: jsonData['comment'] as String? ?? '',
      status: jsonData['status'] as String? ?? '',
      products: jsonData['products'] as List<dynamic>? ?? [],
      address: jsonData['address'] as String? ?? '',
      phoneNumber: jsonData['phoneNumber'] as String? ?? '',
      userId: jsonData['userId'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'status': status,
      'totalPrice': totalPrice,
      // 'orderId': orderId,
      'userId': userId,
      'comment': comment,
      'products': products,
      'address': address,
      'createdAt': createdAt,
      'phoneNumber': phoneNumber
    };
  }

  @override
  String toString() {
    return '''
      username: $username,
      totalPrice: $totalPrice,
      userId: $userId,
      status: $status,
      comment: $comment,
      productsId: $products,
      address: $address,
      createdAt: $createdAt,
      phoneNumber: $phoneNumber,
      ''';
  }
}
