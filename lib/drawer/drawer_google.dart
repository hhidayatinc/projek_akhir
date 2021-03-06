import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasbesar/service/sign_in_google.dart';
import 'package:tugasbesar/pages/login_regis/login_page.dart';

class MainDrawer extends StatelessWidget {
   MainDrawer({
    Key key,
  }) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.only(top: 50), 
        children: <Widget>[
       ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.collections_bookmark, color: Colors.white),
          backgroundColor: Colors.black),
        title: Text("Note & Wishlist"),
        subtitle: Text(_auth.currentUser.email),
      ),
      ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
             Navigator.pushNamed(context, '/home');
          }),
      ListTile(
        leading: Icon(Icons.category),
        title: Text("Category"),
        onTap: () {
           Navigator.pushNamed(context, '/kategori');
        },
      ),
     
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        onTap: () {
          signOutGoogle();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return LoginPage();
          }), ModalRoute.withName('/'));
        },
      )
    ]));
  }
}
