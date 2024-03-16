import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_app/model/model.dart';

class FirebaseService {
  String collectionref = 'PRODUCTS';

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseStorage storage = FirebaseStorage.instance;
  late final CollectionReference<Model> dataref;
  Reference main = FirebaseStorage.instance.ref();

  FirebaseService() {
    dataref = firestore.collection(collectionref).withConverter<Model>(
          fromFirestore: (snapshot, options) =>
              Model.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }
}
