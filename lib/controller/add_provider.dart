import 'package:flutter/material.dart';

class AddProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();

  TextEditingController subNameController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  void clearTextFields() {
    nameController.clear();
    subNameController.clear();
    priceController.clear();
  }
}
