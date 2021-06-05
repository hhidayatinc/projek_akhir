import 'package:flutter/material.dart';
import 'package:tugasbesar/pages/form/edit_note.dart';

class EditNoteScreen extends StatefulWidget {
  final String currentCategory;
  final String currentTitle;
  final String currentDesc;
  final String currentDate;
  final String documentId;

  EditNoteScreen({
     this.currentCategory,
     this.currentTitle,
    this.currentDesc,
    this.currentDate,
    this.documentId,
  });

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final FocusNode _categoryFocusNode = FocusNode();
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _categoryFocusNode.unfocus();
        _titleFocusNode.unfocus();
        _descFocusNode.unfocus();
        _dateFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text("Note"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditNoteForm(
              documentId: widget.documentId,
              focusCategory: _categoryFocusNode,
              focusTitle: _titleFocusNode,
              focusDesc: _descFocusNode,
              focusDate: _dateFocusNode,
              currentCategory: widget.currentCategory,
              currentTitle: widget.currentTitle,
              currentDesc: widget.currentDesc,
          
            ),
          ),
        ),
      ),
    );
  }
}