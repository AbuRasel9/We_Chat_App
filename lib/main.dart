import 'package:flutter/material.dart';
import 'package:we_chat/Screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

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

          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black87,

          )

        ),


      ),
      home:const HomeScreen()

    );
  }
}

