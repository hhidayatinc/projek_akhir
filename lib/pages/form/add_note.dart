import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:date_field/date_field.dart';
import 'package:tugasbesar/database/category.dart';
import 'package:tugasbesar/database/note.dart';

class AddNoteForm extends StatefulWidget {
  FocusNode focusCategory = FocusNode();
  FocusNode focusTitle = FocusNode();
  FocusNode focusDesc = FocusNode();
  FocusNode focusDate = FocusNode();

  AddNoteForm({
    this.focusCategory,
    this.focusTitle,
    this.focusDesc,
    this.focusDate
  });
  @override
  AddNoteFormState createState() => AddNoteFormState();
}

class AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  DateTime _chooseDate = DateTime.now();
  var selectedCategory;
  
  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  final _formNoteKey = GlobalKey<FormState>();
  
  
  @override
  
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Form(
          key: _formNoteKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              // SizedBox(
              //   height: 30,
              // ),
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: Category.readItems(),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            const Text("Loading ...");
                          } else {
                          List<DropdownMenuItem> currencyCategorys = [];
                            for(int i=0; i<snapshot.data.docs.length; i++) {
                              var snap = snapshot.data.docs[i].data();
                              //String docId = snapshot.data.docs[i].id;
                              String name = snap['categoryName'];
                              currencyCategorys.add(
                                DropdownMenuItem(child: Text(name),
                                value: "${name}",
                                )
                              );
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DropdownButton(
                            focusNode: widget.focusCategory,
                            items: currencyCategorys,
                            onChanged: (currencyValue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected Category is $currencyValue',
                                  style: TextStyle(color: kPrimaryLightColor),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedCategory = currencyValue;
                              });
                            },
                            value: selectedCategory,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Category",
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ],
                            );
                          }
                        },
                        )
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
                        focusNode: widget.focusTitle,
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
                        maxLines: 1,
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
                        focusNode: widget.focusDesc,
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
                              category: selectedCategory,
                              title: titleController.text,
                              description: descController.text,
                              date: _chooseDate.toString());
                         
                          Navigator.of(context).pop();
                        }),
                  ))
            ],
          ),
        );
  }
}
