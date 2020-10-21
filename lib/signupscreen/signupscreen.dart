import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginform/loginscreen%20/loginscreen.dart';

class Signup extends StatelessWidget {
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
                  'Register',
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

final _formkey = GlobalKey<FormState>();

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Color borderColour = Colors.transparent;
  TextEditingController getUserName = new TextEditingController();
  TextEditingController getPassword = new TextEditingController();
  TextEditingController getContact = new TextEditingController();
  TextEditingController getEmail = new TextEditingController();
  String setUsername, setPassword, setContact, setEmail;
  ScrollController scrollController;

  Color passwordborderColour = Colors.transparent;
  Color emailborderColour = Colors.transparent;
  Color userBorderColor = Colors.transparent;
  Color phoneBorderColour = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final fullName = TextFormField(
      controller: getUserName,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: new Icon(Icons.account_circle),
        hintText: "Full Name",
      ),
      validator: (value) {
        setState(() {
          if (value.isEmpty) {
            userBorderColor = Colors.red;
            return null;
          } else if (value.isNotEmpty) {
            userBorderColor = Colors.transparent;
            return null;
          }
        });
      },
    );

    final emailField = TextFormField(
      controller: getEmail,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(Icons.mail),
        // icon: new Icon(Icons.mail),
        hintText: "E-Mail",
      ),
      validator: (value) {
        setEmail = getEmail.text;
        setState(() {
          if (value.isEmpty) {
            emailborderColour = Colors.red;
            return null;
          } else {
            String mail = "@gmail.com";

            if (setEmail.contains(mail)) {
              emailborderColour = Colors.transparent;
              return null;
            } else {
              emailborderColour = Colors.red;
              return null;
            }
          }
        });
      },
    );

    final phoneNUmber = TextFormField(
        controller: getContact,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone(10 digits)",
          prefixIcon: Icon(Icons.contact_phone),
        ),
        validator: (value) {
          setContact = getContact.text;
          setState(() {
            if (value.isEmpty) {
              phoneBorderColour = Colors.red;
              return null;
            } else {
              Pattern phonePattern = r'^(?=.*?[0-9]).{10,}$';
              RegExp phoneExp = new RegExp(phonePattern);
              if (phoneExp.hasMatch(setContact)) {
                phoneBorderColour = Colors.transparent;
                return null;
              } else {
                phoneBorderColour = Colors.red;

                return null;
              }
            }
          });
        });

    final passwordField = TextFormField(
      controller: getPassword,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password([A-Z],[a-z],[0-9],[@,#,!])",
        prefixIcon: new Icon(Icons.lock),
      ),
      validator: (value) {
        setPassword = getPassword.text;
        setState(() {
          if (value.isEmpty) {
            passwordborderColour = Colors.red;
            return null;
          } else {
            Pattern passwordPattern =
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
            RegExp regExp = new RegExp(passwordPattern);
            if (regExp.hasMatch(setPassword)) {
              passwordborderColour = Colors.transparent;
              return null;
            } else {
              passwordborderColour = Colors.red;
              return null;
            }
          }
        });
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Signup(),
            Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        shape: StadiumBorder(
                            side: BorderSide(
                          color: userBorderColor,
                        )),
                        child: fullName,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      alignment: Alignment.centerRight,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        shape: StadiumBorder(
                            side: BorderSide(
                          color: phoneBorderColour,
                        )),
                        child: phoneNUmber,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        shape: StadiumBorder(
                          side: BorderSide(color: passwordborderColour),
                        ),
                        child: passwordField,
                      ),
                    ),
                  ],
                )),
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
                  child: Text(
                    'Register',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    print(_formkey.currentState.validate());
                  }),
            ),
            SizedBox(
              height: 24,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Already a member?',
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'Signin',
                  style: TextStyle(color: Colors.blueGrey),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pop(_createRoute());
                    }),
            ])),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        // transitionDuration: Duration(milliseconds: 800),
        // reverseTransitionDuration: Duration(milliseconds: 800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
