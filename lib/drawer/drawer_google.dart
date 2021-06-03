import 'package:flutter/material.dart';
import 'package:tugasbesar/helper/sign_in_google.dart';
import 'package:tugasbesar/pages/login_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

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
        subtitle: Text("Help you to remember things"),
      ),
      ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
             Navigator.pushNamed(context, '/home');
          }),
      ListTile(
        leading: Icon(Icons.category),
        title: Text("Kategori"),
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
