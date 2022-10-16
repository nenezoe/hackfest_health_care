

import 'dart:async';
import 'package:flutter/material.dart';

import 'first_screen.dart';



class SplashScreen extends StatefulWidget {
  // static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                FirstScreen()
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor:  Color(0xFF8AC541),
      body: Center(
        child: Image.asset('assets/images/logo.jpeg'),
      ),
    );

  }
}