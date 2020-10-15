import 'dart:ui';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.orange[900],Colors.orange[800],Colors.orange[700],Colors.orange[600]
          ]
          
        )
      ),
      child: Image.asset('assets/IMG_20201015_184423.png')
    );
  }
}