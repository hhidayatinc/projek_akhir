import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tugasbesar/pages/login_regis/login_page.dart';

// class SplashScreenPage extends StatefulWidget {
//   @override
//   _SplashScreenPageState createState() => _SplashScreenPageState();
// }

// class _SplashScreenPageState extends State<SplashScreenPage> {
//   @override
//   void initState() {
//     super.initState();
//     splashScreen();
//   }

//   splashScreen() async {
//     var duration = const Duration(seconds: 7);
//     return Timer(duration, () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
//         return LoginPage();
//       }));
//     });
//   }

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.fromLTRB(40, 60, 40, 40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("WELCOME",
//             style: TextStyle(fontWeight: FontWeight.w500, fontSize:18)
//             ),
            
//             SvgPicture.asset(
//               "icons/welcome.svg",
//               height: 300,
//               width: 400,
//             ),
            
//             Text("Note & Wishlist",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize:20)
//             ),
//             Text("Help you to remember things!",
//             style: TextStyle(fontWeight: FontWeight.w500, fontSize:18)
//             ),
//           ],
//         ),
//         ),
//     );
//   }
// }

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 50),
      color: Colors.white,
     child: SplashScreen(
        seconds: 7,
      navigateAfterSeconds: LoginPage(),
      title: new Text("Note & WishList", 
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      useLoader: false,
      image: Image.asset('img/hello1.png'),
      photoSize: 180,
     ),
     
    );
  }

}