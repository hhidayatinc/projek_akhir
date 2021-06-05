import 'package:flutter/material.dart';
import 'package:tugasbesar/drawer/drawer_google.dart';
import 'package:tugasbesar/pages/list/note_list.dart';
import 'package:tugasbesar/pages/screen_note/add_screen.dart';

class DashboardNoteScreen extends StatefulWidget {
  @override
  _DashboardNoteScreenState createState() => _DashboardNoteScreenState();
}

class _DashboardNoteScreenState extends State<DashboardNoteScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text("Note"),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: NoteList(),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}