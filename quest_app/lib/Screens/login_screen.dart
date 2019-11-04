import 'package:quest_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:quest_app/Btn_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Resource_page.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textController = TextEditingController();
  final passController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String _email;
  String _pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Sign In",
            style: TextStyle(),
          ),
        ),
        backgroundColor: kMainColor,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Hero(
                tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: textController,
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Email',
                  )),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  controller: passController,
                  onChanged: (value) {
                    _pass = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password',
                  )),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                btnText: 'Sign In',
                btncolor: kMainColor,
                onPressed: () async {
                  textController.clear();
                  passController.clear();
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: _email, password: _pass);
                    //print(user.email);
                    if (user.isEmailVerified) {
                      if (user != null) {
                        Navigator.pushNamed(context, ResourceScreen.id);
                      }
                    } else {
//                      Fluttertoast.showToast(
//                        msg: "Email Not verified.",
//                        toastLength: Toast.LENGTH_SHORT,
//                      );
                      print("Email Not Verified");
                    }
                  } catch (e) {
                    print(e);
//                    Fluttertoast.showToast(
//                      msg: "invalid email or password.",
//                      toastLength: Toast.LENGTH_LONG,
//                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}