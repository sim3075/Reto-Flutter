import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/src/models/service_model.dart';




final FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<ServiceModel>> getAllServices() async {
  CollectionReference servicesRef = db.collection("Services");

  QuerySnapshot querySnapshot = await servicesRef.get();

  return querySnapshot.docs.map((doc) {
    return ServiceModel.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
}



  

 

