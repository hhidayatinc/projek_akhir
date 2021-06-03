import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tugasbesar/drawer/drawer_email.dart';
import 'package:tugasbesar/helper/auth_email.dart';
import 'package:tugasbesar/drawer/drawer_google.dart';
import 'package:tugasbesar/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  var authHandler = new AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Screen Login with Email"), backgroundColor: kPrimaryColor),
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
      // body: SingleChildScrollView(
      //   padding: EdgeInsets.fromLTRB(20, 80, 20, 40),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Row(
      //         children: <Widget>[
      //           Text(
      //             "Hello.",
      //             style: TextStyle(
      //                 color: kPrimaryColor,
      //                 fontWeight: FontWeight.w600,
      //                 letterSpacing: 1.5,
      //                 fontSize: 48),
      //           ),
      //           SizedBox(height: 16),
      //           Expanded(
      //             child: Divider(
      //               color: kPrimaryColor,
      //               thickness: 3,
      //             ),
      //           ),
      //           SizedBox(height: 60),
      //         ],
      //       ),
      //       Text(
      //         "Welcome Back",
      //         style: TextStyle(
      //             color: kPrimaryColor,
      //             fontWeight: FontWeight.w300,
      //             letterSpacing: 3,
      //             fontSize: 36),
      //       ),
      //       SizedBox(height: 90),
      //       Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           mainAxisSize: MainAxisSize.max,
      //           children: <Widget>[
      //             SvgPicture.asset("icons/email.svg", height: size.height*0.15,),
      //             SizedBox(height: 16),
      //             Text(
      //               _auth.currentUser.email,
      //               style: TextStyle(
      //                   fontSize: 25,
      //                   color: kPrimaryColor,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 40),
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
      //               authHandler.signOut();
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
      // ),
      drawer: MainDrawerEmail(),
    );
  }
}
