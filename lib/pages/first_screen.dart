import 'package:flutter/material.dart';
import 'package:tugasbesar/helper/sign_in_google.dart';
import 'package:tugasbesar/drawer/drawer_google.dart';
import 'package:tugasbesar/pages/login_page.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}
class FirstScreenState extends State<FirstScreen> {
  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"), backgroundColor: kPrimaryColor
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text("List Catatan",
              style: TextStyle(fontSize: 18),),),
          ),
          Container(
            padding: EdgeInsets.only(left: 279, bottom: 30),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              backgroundColor: kPrimaryColor,
              onPressed: () {
                
              },),

          )
        ],
      ),
      // body: Container(
      //     child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.max,
      //     children: <Widget>[
      //       CircleAvatar(
      //         backgroundImage: NetworkImage(
      //           imageUrl,
      //         ),
      //         radius: 60,
      //         backgroundColor: Colors.transparent,
      //       ),
      //       SizedBox(height: 40),
      //       Text(
      //         'Welcome Back',
      //         style: TextStyle(
      //             fontSize: 15,
      //             fontWeight: FontWeight.w400,
      //             color: kPrimaryColor),
      //       ),
      //       Text(
      //         email,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: kPrimaryColor,
      //             fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(height: 40),
      //       // ignore: deprecated_member_use
      //       Container(
      //         margin: EdgeInsets.symmetric(vertical: 4),
      //         width: size.width * 0.8,
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(29),
      //           // ignore: deprecated_member_use
      //           child: FlatButton(
      //             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      //             color: kPrimaryColor,
      //             onPressed: () {
      //               signOutGoogle();
      //               Navigator.of(context).pushAndRemoveUntil(
      //                   MaterialPageRoute(builder: (context) {
      //                 return LoginPage();
      //               }), ModalRoute.withName('/'));
      //             },
      //             child: Text(
      //               "Sign Out",
      //               style: TextStyle(color: Colors.white),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // )),
       drawer: MainDrawer(),
    );
  }
}
