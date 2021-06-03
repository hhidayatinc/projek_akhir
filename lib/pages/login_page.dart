import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tugasbesar/helper/auth.dart';
import 'package:tugasbesar/helper/auth_email.dart';
import 'package:tugasbesar/helper/sign_in_google.dart';
import 'package:tugasbesar/pages/first_screen.dart';
import 'package:tugasbesar/form/add_category.dart';
import 'package:tugasbesar/pages/profil_page.dart';
import 'package:tugasbesar/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final kPrimaryColor = Colors.black;
  final kPrimaryLightColor = Colors.white;
  final _formKey = GlobalKey<FormState>();
  var authHandler = new AuthService();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool _isHidePass = true;

  void _togglePasswordvisibility() {
    setState(() {
      _isHidePass = !_isHidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(40, 60, 40, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "icons/login.svg",
            height: 150,
          ),
          _form(),
          _loginWithEmail(),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "OR",
                style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: kPrimaryColor,
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AddCategoryForm();
                      }));
                    }
                  });
                },
                child: Text(
                  "Sign in With Google",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Don’t have account ?",
                    style: TextStyle(color: kPrimaryColor, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      "Register here",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                ],
              ),
              ),
        ],
      ),
    ));
  }

  Widget _form() {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
                border: Border.all(color: kPrimaryColor, width: 1),
              ),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(Icons.people, color: kPrimaryColor),
                  hintText: "Username",
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter an Email Address';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
                border: Border.all(color: kPrimaryColor, width:1),
              ),
              child: TextFormField(
                controller: _passController,
                obscureText: _isHidePass,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _togglePasswordvisibility();
                    },
                    child: Icon(
                      _isHidePass ? Icons.visibility_off : Icons.visibility,
                      color: _isHidePass ? kPrimaryColor : kPrimaryColor,
                    ),
                  ),
                  isDense: true,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Password';
                  } else if (value.length < 6) {
                    return 'Password must be atleast 6 characters!';
                  }
                  return null;
                },
              ),
            ),
          ],
        ));
  }

  Widget _loginWithEmail() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // ignore: deprecated_member_use
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryColor,
          onPressed: () async {
            SignInSignUpResult result = await AuthService.signInWithEmail(
                email: _emailController.text, pass: _passController.text);
            if (result.user != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new AddCategoryForm()));
            } else {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          title: Text("Error"),
                          content: Text(result.message),
                          actions: <Widget>[
                            // ignore: deprecated_member_use
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"))
                          ]));
            }
          },
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}