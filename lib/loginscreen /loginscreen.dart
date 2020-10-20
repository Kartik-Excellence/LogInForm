import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

final _loginFormKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color passwordborderColour = Colors.transparent;
  Color emailborderColour = Colors.transparent;
  String email;
  String password;
  bool isEmail = false;
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController textEditingControll = new TextEditingController();
  @override
  Widget build(BuildContext context) {



    final emailField = TextFormField(
      controller: textEditingController,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: new Icon(Icons.mail),
        hintText: "E-Mail",
      ),
      validator: (value) {
        setState(() {
          if (value.isEmpty) {
            emailborderColour = Colors.red;
            return null;
          } else if (value.isNotEmpty) {
            emailborderColour = Colors.transparent;
            return null;
          }
        });
      },
    );



    final passwordField = TextFormField(
      controller: textEditingControll,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hoverColor: Colors.grey,
        hintText: "Password",
        prefixIcon: new Icon(Icons.lock),
      ),
      validator: (value) {
        if (value.isEmpty) {
          passwordborderColour = Colors.red;
        } else if (value.isNotEmpty) {
          passwordborderColour = Colors.transparent;
        }
        return null;
      },
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Login(),
          Form(
            key: _loginFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 8,
                    shape: StadiumBorder(
                        side: BorderSide(
                      color: emailborderColour,
                    )),
                    child: emailField,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 8,
                    shape: StadiumBorder(
                        side: BorderSide(
                      color: passwordborderColour,
                    )),
                    child: passwordField,
                  ),
                ),
              ],
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
              padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold ),),
              textColor: Colors.white,
              onPressed: () {
                print(_loginFormKey.currentState.validate());
                email = textEditingController.text;
                password = textEditingControll.text;
                if (_loginFormKey.currentState.validate()) {
                  print(email + '\n' + password);
                } else
                  return null;
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: 'Dont have account?',style: TextStyle(color: Colors.black)),
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
