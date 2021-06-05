import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tugasbesar/database/category.dart';

class EditCategoryForm extends StatefulWidget {
  final FocusNode focusCategoryName;
  final FocusNode focusDescription;
  final String currentCategoryName;
  final String currentDescription;
  final String documentId;

  const EditCategoryForm({
    this.focusCategoryName,
    this.focusDescription,
    this.currentCategoryName,
    this.currentDescription,
    this.documentId,
  });
  @override
  EditCategoryFormState createState() => EditCategoryFormState();
}

class EditCategoryFormState extends State<EditCategoryForm> {
  final _editCategoryKey = GlobalKey<FormState>();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  @override
  void initState() {
    categoryNameController =
        TextEditingController(text: widget.currentCategoryName);
    descriptionController =
        TextEditingController(text: widget.currentDescription);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _editCategoryKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            "icons/add_category.svg",
            height: 200,
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
                    controller: categoryNameController,
                    focusNode: widget.focusCategoryName,
                    keyboardType: TextInputType.text,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                        labelText: "Category Name",
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
                    controller: descriptionController,
                    focusNode: widget.focusDescription,
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
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: RawMaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Update data",
                        style: TextStyle(
                            color: kPrimaryLightColor, fontSize: 18.0)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 5.0,
                    fillColor: kPrimaryColor,
                    onPressed: () async {
                      await Category.updateItem(
                          docId: widget.documentId,
                          categoryName: categoryNameController.text,
                          description: descriptionController.text);
                      Navigator.of(context).pop();
                    }),
              ))
        ],
      ),
    );
  }
}
