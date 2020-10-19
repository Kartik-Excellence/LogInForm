import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginform/main.dart';
import 'package:loginform/signupscreen/signupscreen.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 70),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[700],
                  Colors.orange[600]
                ])),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/IMG_20201015_184423.png'),
            ),
            Container(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  'LogIn',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.bottomRight)
          ],
        ));
  }
}

class LoginScreen extends StatelessWidget {
  String email;
  String password;
  bool isEmail = false;
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController textEditingControll = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: textEditingController,
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: new Icon(Icons.mail),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: textEditingControll,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hoverColor: Colors.grey,
          hintText: "Password",
          prefixIcon: new Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Login(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              shadowColor: Colors.black,
              elevation: 8,
              shape: StadiumBorder(),
              child: emailField,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.centerRight,
            child: Card(
              shadowColor: Colors.black,
              elevation: 8,
              shape: StadiumBorder(),
              child: passwordField,
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerRight,
              child: Text('ForgotPassword')),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.orange[900],
                      Colors.orange[800],
                      Colors.orange[700],
                      Colors.orange[600]
                    ])),
            child: FlatButton(
              child: Text('Login'),
              textColor: Colors.white,
              onPressed: () {
                String mail = "@gmail.com";
                email = textEditingController.text;
                if (email.contains(mail)) {

                  print('valid email');
                } else
                  print('invalid mail');
              },
            ),
          ),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: 'Dont have account:'),
            TextSpan(
                text: 'Signup',
                style: TextStyle(color: Colors.blueGrey),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  }),
          ]))
        ],
      ),
    );
  }
}
