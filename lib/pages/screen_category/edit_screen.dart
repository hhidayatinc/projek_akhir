import 'package:flutter/material.dart';
import 'package:tugasbesar/pages/form/edit_category.dart';

class EditScreen extends StatefulWidget {
  final String currentName;
  final String currentDesc;
  final String documentId;

  EditScreen({
     this.currentName,
    this.currentDesc,
    this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _nameFocusNode = FocusNode();

  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
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
            child: EditCategoryForm(
              documentId: widget.documentId,
              focusCategoryName: _nameFocusNode,
              focusDescription: _descriptionFocusNode,
              currentCategoryName: widget.currentName,
              currentDescription: widget.currentDesc,
            ),
          ),
        ),
      ),
    );
  }
}