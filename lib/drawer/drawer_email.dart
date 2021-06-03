import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasbesar/helper/auth_email.dart';
import 'package:tugasbesar/pages/login_page.dart';

class MainDrawerEmail extends StatelessWidget {
  const MainDrawerEmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authHandler = new AuthService();
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Drawer(
        child: ListView(padding: EdgeInsets.only(top: 50), children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.email, color: Colors.white),
          backgroundColor: Colors.black,
        ),
        title: Text("Welcome"),
        subtitle: Text(_auth.currentUser.email),
      ),
      ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            Navigator.pushNamed(context, '/profil');
          }),
      ListTile(
        leading: Icon(Icons.category),
        title: Text("Kategori"),
        onTap: () {
          // Navigator.pushNamed(context, '/kategori');
        },
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        onTap: () {
          authHandler.signOut();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return LoginPage();
          }), ModalRoute.withName('/'));
        },
      )
    ]));
  }
}
