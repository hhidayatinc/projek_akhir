import 'package:flutter/material.dart';
import 'package:tugasbesar/contoh_sederhana/main_page.dart';
import 'package:tugasbesar/pages/first_screen.dart';
import 'package:tugasbesar/pages/kategori_list.dart';
import 'package:tugasbesar/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugasbesar/form/add_category.dart';
import 'package:tugasbesar/pages/profil_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Note with Login',
      home: MainPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/home': (context) => FirstScreen(),
      //   '/profil': (context) => ProfilePage(),
      // },
    );
  }
}