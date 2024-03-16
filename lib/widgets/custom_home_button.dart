import 'package:flutter/material.dart';
import 'package:flutter_app/controller/add_provider.dart';
import 'package:flutter_app/controller/home_provider.dart';
import 'package:flutter_app/model/model.dart';
import 'package:flutter_app/views/home_page.dart';
import 'package:provider/provider.dart';

class AddContainer extends StatelessWidget {
  const AddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false);
    final prv = Provider.of<AddProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        addDt(context);
        prv.clearTextFields();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
            boxShadow: const [
              BoxShadow(
                  color: Colors.purple,
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
            "Add",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void addDt(context) {
    final pro = Provider.of<AddProvider>(context, listen: false);
    final prov = Provider.of<HomeProvider>(context, listen: false);
    final name = pro.nameController.text;
    final subName = pro.subNameController.text;
    final price = pro.priceController.text;
    final student = Model(name: name, subName: subName, price: price);
    prov.addData(student);
  }
}
