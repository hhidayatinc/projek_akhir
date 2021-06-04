import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugasbesar/database/note.dart';

class NoteList extends StatelessWidget {
  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Notes.readContent(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16.0),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var noteInfo = snapshot.data.docs[index].data();
                String docID = snapshot.data.docs[index].id;
                String category = noteInfo['category'];
                String title = noteInfo['title'];
                String description = noteInfo['description'];
                String date = noteInfo['date'];

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
                          Icons.note,
                          color: kPrimaryLightColor,
                        ),
                      ),
                      title: Row(children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            category,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              date,
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              description,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        //widget untuk mendeteksi sentuhan
                        child: Icon(Icons.delete),
                        onTap: () async {
                          await Notes.deleteContent(docId: docID);
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
