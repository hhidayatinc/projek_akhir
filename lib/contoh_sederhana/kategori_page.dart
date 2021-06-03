import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugasbesar/contoh_sederhana/kategori.dart';
import 'package:tugasbesar/drawer/drawer_google.dart';

class KategoriPage extends StatelessWidget {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  CollectionReference _category =
      FirebaseFirestore.instance.collection('category');

  void clearInputText() {
    categoryNameController.text = "";
    descriptionController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Category'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-5, 0),
                      blurRadius: 15,
                      spreadRadius: 3)
                ]),
                width: double.infinity,
                height: 130,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            controller: categoryNameController,
                            decoration: InputDecoration(
                                hintText: "Category Name",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                          TextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            controller: descriptionController,
                            decoration: InputDecoration(
                                hintText: "Description",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.black,
                          child: Text(
                            'Add Data',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            // TODO 1 ADD DATA HERE
                            await _category.add({
                              "categoryName": categoryNameController.text,
                              "description": descriptionController.text
                            });
                            clearInputText();
                          }),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: ListView(
              children: [
                // TODO 2 VIEW, update , and delete DATA HERE
                /// hanya get sekali saja jika menggunakan FutureBuilder
                /*
                  FutureBuilder<QuerySnapshot>(
                    future: _pengguna.get(),
                    builder: (buildContext, snapshot) {
                      return Column(
                        children: snapshot.data!.docs
                            .map((e) =>
                                ItemCard(e.data()['name'], e.data()['age']))
                            .toList(),
                      );
                    },
                  ),
                  */

                // get secara realtime jikga menggunakan stream builder
                StreamBuilder<QuerySnapshot>(
                  // contoh penggunaan srteam
                  // _pengguna.orderBy('age', descending: true).snapshots()
                  // _pengguna.where('age', isLessThan: 30).snapshots()
                  stream: _category
                      .orderBy('categoryName', descending: true)
                      .snapshots(),
                  builder: (buildContext, snapshot) {
                    return Column(
                      children: snapshot.data.docs
                          .map((e) => Kategori(
                                e.data()['categoryName'],
                                e.data()['description'],
                                onUpdate: () {
                                  _category.doc(e.id).update({
                                    "categoryName" : categoryNameController.text,
                                    "description": descriptionController.text
                                  });
                                  clearInputText();
                                },
                                onDelete: () {
                                  _category.doc(e.id).delete();
                                },
                              ))
                          .toList(),
                    );
                  },
                ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
