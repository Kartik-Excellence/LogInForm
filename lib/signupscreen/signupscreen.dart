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
                style:
                    TextStyle(color: Colors.white,fontSize:20, fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.bottomRight
            )
          ],
        ));
  }
}

class SignupScreen extends StatelessWidget {
  TextEditingController getUserName = new TextEditingController();
  TextEditingController getPassword = new TextEditingController();
  TextEditingController getContact = new TextEditingController();
  TextEditingController getEmail = new TextEditingController();
  String setUsername, setPassword, setContact, setEmail;

  @override
  Widget build(BuildContext context) {
    final fullName = TextField(
      controller: getUserName,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: new Icon(Icons.account_circle),
          hintText: "FullName",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final emailField = TextField(
      controller: getEmail,
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(Icons.mail),
         // icon: new Icon(Icons.mail),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final phoneNUmber = TextField(
      controller: getContact,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "phoneNumber",
          
          prefixIcon: Icon(Icons.contact_phone),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: getPassword,
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: new Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Signup(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              alignment: Alignment.centerRight,
               child: Card(
              shadowColor: Colors.black,
              elevation: 8,
              shape: StadiumBorder(),
              child: fullName ,
            ),
              ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              alignment: Alignment.centerRight,
               child: Card(
              shadowColor: Colors.black,
              elevation: 8,
              shape: StadiumBorder(),
              child: emailField ,
            ),
              ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              alignment: Alignment.centerRight,
              child: Card(
              shadowColor: Colors.black,
              elevation: 8,
              shape: StadiumBorder(),
              child: phoneNUmber ,
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
                ])
            ),
            child: FlatButton(
              child: Text('Signup'),
             // color: Colors.orange,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                String mail = "@gmail";
                setUsername = getUserName.text;
                setEmail = getEmail.text;
                setContact = getContact.text;
                setPassword = getPassword.text;
                if (setEmail.contains(mail)) {
                  print('Username:'+setUsername +
                  '\nE-Mail'+setEmail +
                  '\nContact'+setContact +
                  '\nPassword'+setPassword);
                } else
                  print('Enter Valid Main Id');
              },
            ),
          ),
          RichText(text: 
          TextSpan(children: <TextSpan>[
            TextSpan(text: 'Already a member:'),
            TextSpan(text: 'Signin',style: TextStyle(color: Colors.blueGrey),
            recognizer: TapGestureRecognizer()..onTap=(){
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen() ));
            }
            ),
          ])
          )
        ],
      ),
    );
  }
}
