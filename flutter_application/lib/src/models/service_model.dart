import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String? serviceId;
  String name;
  String description;
  double price;
  String category;
  String providerId;
  String imageUrl;
  Timestamp createdAt;


  ServiceModel({
    this.serviceId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.providerId,
    required this.imageUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'providerId': providerId,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      serviceId: map['serviceId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      category: map['category'],
      providerId: map['providerId'],
      imageUrl: map['imageUrl'],
      createdAt: map['createdAt'],
    );
  }
}
