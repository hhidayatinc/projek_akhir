import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasbesar/database/category.dart';
import 'package:tugasbesar/form/add_category.dart';
import 'package:tugasbesar/form/edit_category.dart';

class CategoryList extends StatelessWidget {
  CollectionReference _category =
      FirebaseFirestore.instance.collection('category');
  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Category.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16.0),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var categoryInfo = snapshot.data.docs[index].data();
                String docID = snapshot.data.docs[index].id;
                String title = categoryInfo['categoryName'];
                String description = categoryInfo['description'];

                return Ink(
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kPrimaryColor, width: 1),
                  ),
                  child: Card(
                    color: kPrimaryLightColor,
                    elevation: 3.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          Icons.category,
                          color: kPrimaryLightColor,
                        ),
                      ),
                      title: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //horizontal
                        mainAxisAlignment: MainAxisAlignment.start, //vertical
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              description,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        //widget untuk mendeteksi sentuhan
                        child: Icon(Icons.delete),
                        onTap: () async {
                          await Category.deleteItem(docId: docID);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                );
              
              
              });
        }
      },
    );
  }
}
