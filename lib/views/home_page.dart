import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/controller/home_provider.dart';
import 'package:flutter_app/model/model.dart';
import 'package:flutter_app/views/add_page.dart';
import 'package:flutter_app/views/edit_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Consumer<HomeProvider>(builder: (context, value, child) {
        return StreamBuilder<QuerySnapshot<Model>>(
          stream: value.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              log("${snapshot.error}");
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            List<QueryDocumentSnapshot<Model>> donatorDocs =
                snapshot.data?.docs ?? [];
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: donatorDocs.length,
              itemBuilder: (context, index) {
                Model donor = donatorDocs[index].data();
                final id = donatorDocs[index].id;
                return Card(
                  color: Colors.white,
                  child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                pro.deleteData(id);
                              },
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                              id: id,
                                              student: donor,
                                            )));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      title: Text(
                        donor.name ?? ''.toUpperCase(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      subtitle: Text(
                        donor.subName ?? '',
                        style: const TextStyle(color: Colors.black),
                      )),
                );
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddScreen()));
          },
          label: const Text(
            "Add",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
