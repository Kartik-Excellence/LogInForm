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

class SignupScreen extends StatelessWidget {
  TextEditingController getUserName = new TextEditingController();
  TextEditingController getPassword = new TextEditingController();
  TextEditingController getContact = new TextEditingController();
  TextEditingController getEmail = new TextEditingController();
  String setUsername, setPassword, setContact, setEmail;
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final fullName = TextFormField(
      controller: getUserName,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: new Icon(Icons.account_circle),
          hintText: "FullName",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        setUsername = getUserName.text;
        if (value.isEmpty) {
          return 'Enter Username';
        }
        return null;
      },
    );

    final emailField = TextFormField(
      controller: getEmail,
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(Icons.mail),
          // icon: new Icon(Icons.mail),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        setEmail = getEmail.text;
        if (value.isEmpty) {
          return 'Enter Email';
        } else {
          String mail = "@gmail.com";

          if (setEmail.contains(mail)) {
          } else {
            return 'Enter Valid mail';
          }
        }
        return null;
      },
    );

    final phoneNUmber = TextFormField(
        controller: getContact,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "phoneNumber",
            prefixIcon: Icon(Icons.contact_phone),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        validator: (value) {
          setContact = getContact.text;
          if (value.isEmpty) {
            return 'Enter PhoneNUmber';
          } else {
            Pattern phonePattern = r'^(?=.*?[0-9]).{10,}$';
            RegExp phoneExp = new RegExp(phonePattern);
            if (phoneExp.hasMatch(setContact)) {
            } else {
              return 'Enter Valid Contact';
            }
          }
          return null;
        });

    final passwordField = TextFormField(
      controller: getPassword,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: new Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        setPassword = getPassword.text;
        if (value.isEmpty) {
          return 'Enter Password';
        } else {
          Pattern passwordPattern =
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
          RegExp regExp = new RegExp(passwordPattern);
          if (regExp.hasMatch(setPassword)) {
          } else {
            return 'Enter valid Password';
          }
        }
        return null;
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
                  //mainAxisAlignment:  MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                    
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        shape: StadiumBorder(),
                        child: fullName,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        shape: StadiumBorder(),
                        child: emailField,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        shape: StadiumBorder(),
                        child: phoneNUmber,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        shape: StadiumBorder(),
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
                  child: Text('Signup'),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      //print('tapped');
                      print(setEmail +
                          '\n' +
                          setUsername +
                          '\n' +
                          setContact +
                          '\n' +
                          setPassword);
                    } else
                      return null;
                  }),
            ),
            SizedBox(
              height: 24,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(text: 'Already a member:'),
              TextSpan(
                  text: 'Signin',
                  style: TextStyle(color: Colors.blueGrey),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    }),
            ]))
          ],
        ),
      ),
    );
  }
}
