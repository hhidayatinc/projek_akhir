import 'package:flutter/material.dart';

class Kategori extends StatelessWidget {
  final String categoryName;
  final String description;
  final Function onUpdate;
  final Function onDelete;
  Kategori(this.categoryName, this.description, {this.onUpdate, this.onDelete});

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
                  categoryName,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Text(description,
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
