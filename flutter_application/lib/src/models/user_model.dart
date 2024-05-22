import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String email;
  String name;
  String phoneNumber;
  String profilePictureUrl;
  String address;
  GeoPoint location;
  List<String>? orderHistory;
 

  UserModel({
    this.userId,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.profilePictureUrl,
    required this.address,
    required this.location,
    this.orderHistory,

  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'profilePictureUrl': profilePictureUrl,
      'address': address,
      'location': location,
      'orderHistory': orderHistory,

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      profilePictureUrl: map['profilePictureUrl'],
      address: map['address'],
      location: map['location'],
      orderHistory: List<String>.from(map['orderHistory']),
    );
  }
}
