class OrderModel {
  final String address;
  final String comment;
  final String createdAt;
  final String orderId;
  final String phoneNumber;
  final List<String> productsId;
  final double totalPrice;
  final String username;
  final String status;
  final String userId;

  OrderModel(
      {required this.createdAt,
      required this.address,
      required this.comment,
      required this.orderId,
      required this.phoneNumber,
      required this.productsId,
      required this.totalPrice,
      required this.username,required this.status,required this.userId});

  OrderModel copWith({
    double? totalPrice,
    String? orderId,
    String? status,
    List<String>? productsId,
    String? username,
    String? comment,
    String? createdAt,
    String? address,
    String? phoneNumber,
    String? userId,
  }) =>
      OrderModel(
        productsId: productsId ?? this.productsId,
        totalPrice: totalPrice ?? this.totalPrice,
        orderId: orderId ?? this.orderId,
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
      totalPrice: jsonData['totalPrice'] as double? ?? 0,
      orderId: jsonData['orderId'] as String? ?? '',
      comment: jsonData['comment'] as String? ?? '',
      status: jsonData['status'] as String? ?? '',
      productsId: jsonData['productsId'] as List<String>? ?? [],
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
      'orderId': orderId,
      'userId': userId,
      'comment': comment,
      'productsId': productsId,
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
      orderId: $orderId,
      comment: $comment,
      productsId: $productsId,
      address: $address,
      createdAt: $createdAt,
      phoneNumber: $phoneNumber,
      ''';
  }
}
