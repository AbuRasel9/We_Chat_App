import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_chat/Screens/auth/login_screens.dart';
import 'package:we_chat/Screens/home_screens.dart';
import 'package:we_chat/api/api.dart';
import 'package:we_chat/main.dart';
import 'package:get/get.dart';

//spalsh screen
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      //Navigate to home screen
      if (APIs.Auth.currentUser != null) {
        //print current user details
        log("/n Users${APIs.Auth.currentUser}");
        //navigate to home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {

        //navigate to login screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To We Chat"),
      ),
      body: Stack(
        children: [
          //app logo
          Positioned(
              top: mq.height * .15,
              right: mq.width * .12,
              width: mq.height * .35,
              child: Image.asset('images/icon.png')),

          Positioned(
            bottom: mq.height * .10,
            child: const Text(
              "          Made In Bangladesh ❤️❤️❤️",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
