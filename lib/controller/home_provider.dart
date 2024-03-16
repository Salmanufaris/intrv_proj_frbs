import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/model.dart';
import 'package:flutter_app/services/firebase_services.dart';

class HomeProvider extends ChangeNotifier {
  FirebaseService _firebaseService = FirebaseService();

  Stream<QuerySnapshot<Model>> getData() {
    return _firebaseService.dataref.snapshots();
  }

  addData(Model student) async {
    await _firebaseService.dataref.add(student);
    notifyListeners();
  }

  deleteData(id) async {
    await _firebaseService.dataref.doc(id).delete();
    notifyListeners();
  }

  updateData(id, Model student) async {
    await _firebaseService.dataref.doc(id).update(student.toJson());
    notifyListeners();
  }
}
