import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:date_field/date_field.dart';
import 'package:tugasbesar/contoh_sederhana/note.dart';
import 'package:tugasbesar/database/note.dart';

class AddNoteForm extends StatefulWidget {
  @override
  AddNoteFormState createState() => AddNoteFormState();
}

class AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  DateTime _chooseDate = DateTime.now();
  // CollectionReference _category =
  //     FirebaseFirestore.instance.collection('category');

  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  final _formNoteKey = GlobalKey<FormState>();
  final FocusNode focusCategory = FocusNode();
  final FocusNode focusTitle = FocusNode();
  final FocusNode focusDesc = FocusNode();

  void clearInputText() {
    categoryController.text = "";
    titleController.text = "";
    descController.text = "";
    _chooseDate == null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Note'),
          backgroundColor: kPrimaryColor,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Form(
          key: _formNoteKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                "icons/add_note.svg",
                height: 150,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor, width: 1),
                      ),
                      child: TextFormField(
                        controller: categoryController,
                        focusNode: focusCategory,
                        keyboardType: TextInputType.text,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Category",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor, width: 1),
                      ),
                      child: TextFormField(
                        controller: titleController,
                        focusNode: focusTitle,
                        keyboardType: TextInputType.text,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Title",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: null,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor, width: 1),
                      ),
                      child: TextFormField(
                        controller: descController,
                        focusNode: focusDesc,
                        keyboardType: TextInputType.text,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Description",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: null,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
                      child: DateTimeField(
                          onDateSelected: (DateTime value) {
                            setState(() {
                              _chooseDate = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            labelText: 'Choose Date',
                            icon: Icon(Icons.date_range),
                          ),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                          mode: DateTimeFieldPickerMode.date,
                          //memasukkan data yang dipilih kedalam atribut yang disediakan dengan tipe data DateTime
                          selectedDate: _chooseDate),
                    ),
                  ],
                ),
              ),
              
              Container(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: RawMaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text("Add data",
                            style: TextStyle(
                                color: kPrimaryLightColor, fontSize: 18.0)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        elevation: 5.0,
                        fillColor: kPrimaryColor,
                        onPressed: () async {
                          await Notes.addContent(
                              category: categoryController.text,
                              title: titleController.text,
                              description: descController.text,
                              date: _chooseDate.toString());
                          clearInputText();
                          Navigator.of(context).pop();
                        }),
                  ))
            ],
          ),
        ));
  }
}
