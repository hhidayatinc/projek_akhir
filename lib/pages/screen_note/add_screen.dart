import 'package:flutter/material.dart';
import 'package:tugasbesar/pages/form/add_note.dart';

class AddNoteScreen extends StatelessWidget {
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
          title: Text("Category"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddNoteForm(
              focusCategory: _categoryFocusNode,
              focusTitle: _titleFocusNode,
              focusDesc: _descFocusNode,
              focusDate: _dateFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}