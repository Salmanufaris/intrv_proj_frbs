import 'package:flutter/material.dart';
import 'package:flutter_app/controller/add_provider.dart';
import 'package:flutter_app/controller/home_provider.dart';

import 'package:flutter_app/widgets/custom_home_button.dart';

import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AddProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Add details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<HomeProvider>(
            builder: (context, value, child) => Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                    controller: pro.nameController,
                    decoration: const InputDecoration(
                        hintText: "Name", border: OutlineInputBorder())),
                const SizedBox(height: 10),
                TextFormField(
                    controller: pro.subNameController,
                    decoration: const InputDecoration(
                        hintText: "SubName", border: OutlineInputBorder())),
                const SizedBox(height: 10),
                TextFormField(
                    controller: pro.priceController,
                    decoration: const InputDecoration(
                        hintText: "price", border: OutlineInputBorder())),
                const SizedBox(height: 10),
                AddContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
