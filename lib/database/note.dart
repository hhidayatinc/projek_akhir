import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String category;
  final String noteName;
  final String noteDesc;
  final Function onUpdate;
  final Function onDelete;
  Category(this.category, this.noteName, this.noteDesc, {this.onUpdate, this.onDelete});

  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  noteName,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Text(noteDesc,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16))
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: kPrimaryColor,
                    child: Center(
                      child:
                          Icon(Icons.arrow_upward, color: kPrimaryLightColor),
                    ),
                    onPressed: () {
                      if (onUpdate != null) onUpdate();
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: kPrimaryColor,
                    child: Center(
                      child:
                          Icon(Icons.delete, color: kPrimaryLightColor),
                    ),
                    onPressed: () {
                      if (onDelete != null) onDelete();
                      //onDelete();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
