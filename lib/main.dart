import 'package:flutter/material.dart';
import 'package:tugasbesar/contoh_sederhana/kategori_page.dart';
import 'package:tugasbesar/contoh_sederhana/note_page.dart';
import 'package:tugasbesar/pages/form/add_note.dart';
import 'package:tugasbesar/pages/login_regis/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugasbesar/pages/screen_category/dashboard.dart';
import 'package:tugasbesar/pages/screen_note/dashboard.dart';

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
      //home: 
      //NotePage(),
      //KategoriPage()
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => DashboardNoteScreen(),
        '/kategori': (context) => DashboardScreen(),
      },
    );
  }
}