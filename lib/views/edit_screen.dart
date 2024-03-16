import 'package:flutter/material.dart';
import 'package:flutter_app/controller/add_provider.dart';
import 'package:flutter_app/controller/home_provider.dart';
import 'package:flutter_app/model/model.dart';
import 'package:flutter_app/views/home_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  Model student;
  String id;
  EditScreen({super.key, required this.id, required this.student});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    final pro = Provider.of<AddProvider>(context, listen: false);
    super.initState();

    pro.nameController.text = widget.student.name ?? '';
    pro.subNameController.text = widget.student.subName ?? '';
    pro.priceController.text = widget.student.price ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Edit details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Consumer<AddProvider>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                TextFormField(
                    controller: value.nameController,
                    decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: value.subNameController,
                    decoration: InputDecoration(
                        hintText: "Age",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: value.priceController,
                    decoration: InputDecoration(
                        hintText: "class",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade300,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(4, 4)),
                          BoxShadow(
                              color: Colors.white,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(-4, -4))
                        ]),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  editStudent(BuildContext context) async {
    final prov = Provider.of<HomeProvider>(context, listen: false);
    final pro = Provider.of<AddProvider>(context, listen: false);
    final editedname = pro.nameController.text;
    final editedSubName = pro.subNameController.text;
    final editedPrice = pro.priceController.text;

    final updatedstudent = Model(
      name: editedname,
      subName: editedSubName,
      price: editedPrice,
    );

    prov.updateData(widget.id, updatedstudent);

    Navigator.pop(context);
  }
}
