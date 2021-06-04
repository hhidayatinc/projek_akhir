import 'package:flutter/material.dart';
import 'package:tugasbesar/contoh_sederhana/kategori_page.dart';
import 'package:tugasbesar/contoh_sederhana/note_page.dart';
import 'package:tugasbesar/form/add_note.dart';
import 'package:tugasbesar/pages/first_screen.dart';
import 'package:tugasbesar/list/kategori_list.dart';
import 'package:tugasbesar/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugasbesar/form/add_category.dart';
import 'package:tugasbesar/pages/profil_page.dart';
import 'package:tugasbesar/screen/dashboard.dart';

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
      home: DashboardScreen()
      //LoginPage(),
      //AddNoteForm(),
      //AddCategoryForm()
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/home': (context) => NotePage(),
      //   '/kategori': (context) => KategoriPage(),
      // },
    );
  }
}