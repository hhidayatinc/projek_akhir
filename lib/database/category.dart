import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugasbesar/database/note.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Category {
  static String userUid;

  static Future<void> addItem({
     String categoryName,
     String description,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('categorys').doc();

    //setdata
    // DocumentReference documentReferencer =
    //     _mainCollection.doc('categorys');

    Map<String, dynamic> data = <String, dynamic>{
      "categoryName": categoryName,
      "description": description,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Category added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String categoryName,
     String description,
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('categorys').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "categoryName": categoryName,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Category updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesCategoryCollection =
        _mainCollection.doc(userUid).collection('categorys');

    return notesCategoryCollection.snapshots();
  }

  static Future<void> deleteItem({
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('categorys').doc(docId);


    await documentReferencer
        .delete()
        .whenComplete(() => print('Category deleted from the database'))
        .catchError((e) => print(e));

  }
}