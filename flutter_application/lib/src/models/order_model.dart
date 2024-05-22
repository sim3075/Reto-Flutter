import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? orderId;
  String userId;
  String serviceId;
  String orderDetails;
  String status;
  Timestamp orderDate;
  GeoPoint deliveryLocation;
  double totalPrice;

  OrderModel({
    this.orderId,
    required this.userId,
    required this.serviceId,
    required this.orderDetails,
    required this.status,
    required this.orderDate,
    required this.deliveryLocation,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'serviceId': serviceId,
      'orderDetails': orderDetails,
      'status': status,
      'orderDate': orderDate,
      'deliveryLocation': deliveryLocation,
      'totalPrice': totalPrice,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      userId: map['userId'],
      serviceId: map['serviceId'],
      orderDetails: map['orderDetails'],
      status: map['status'],
      orderDate: map['orderDate'],
      deliveryLocation: map['deliveryLocation'],
      totalPrice: map['totalPrice'],
    );
  }
}
