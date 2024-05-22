import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderModel {
  String? providerId;
  String name;
  String email;
  String phoneNumber;
  String address;
  GeoPoint location;
  String profilePictureUrl;
  List<String>? servicesOffered;



  ProviderModel({
    this.providerId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.location,
    required this.profilePictureUrl,
    this.servicesOffered,


  });

  Map<String, dynamic> toMap() {
    return {
      'providerId': providerId,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'location': location,
      'profilePictureUrl': profilePictureUrl,
      'servicesOffered': servicesOffered,


    };
  }

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      providerId: map['providerId'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      location: map['location'],
      profilePictureUrl: map['profilePictureUrl'],
      servicesOffered: List<String>.from(map['servicesOffered']),


    );
  }
}
