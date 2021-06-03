import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final Function onUpdate;
  final Function onDelete;
  Note(this.category,this.title, this.description, {this.onUpdate, this.onDelete});

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
                  category,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Text(
                  title,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  description,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              // Text(description,
              //     style: TextStyle(
              //         color: kPrimaryColor,
              //         fontWeight: FontWeight.w600,
              //         fontSize: 16))
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
                      //if (onUpdate != null) onUpdate();
                      onUpdate();
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
