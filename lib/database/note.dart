import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Notes {
   static String userUid;
  static Future<void> addContent({
     String category,
     String title,
     String description,
     String date,
     
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('contents').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "category": category,
      "title": title,
      "description": description,
      "date": date,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("New note added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateContent({
    String category,
     String title,
     String description,
     String date,
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('contents').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
       "category": category,
      "title": title,
      "description": description,
      "date": date,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readContent() {
    CollectionReference notesContentCollection =
        _mainCollection.doc(userUid).collection('contents');

    return notesContentCollection.snapshots();
  }

  static Future<void> deleteContent({
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('contents').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note deleted from the database'))
        .catchError((e) => print(e));
  }
}