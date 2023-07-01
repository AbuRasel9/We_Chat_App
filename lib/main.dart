import 'package:flutter/material.dart';
import 'package:we_chat/Screens/auth/login_screens.dart';
import 'package:we_chat/Screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}
//global object for accessing device screen size
late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'We Chat',

      theme: ThemeData(
        //appBar style
        appBarTheme:  AppBarTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          elevation: 2,
          //Icon style
          iconTheme: const IconThemeData(color: Colors.black,weight: 500),

          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black,

          )

        ),


      ),
      home:const LoginScreen()

    );
  }
}

