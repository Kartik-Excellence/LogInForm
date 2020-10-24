import 'package:flutter/cupertino.dart';
import 'package:flutter/semantics.dart';
import 'package:loginform/signupscreen/signupscreen.dart';

class PageRoute extends CupertinoPageRoute {
  PageRoute()
      : super(
          builder: (context) => SignupScreen(),
        );
}
