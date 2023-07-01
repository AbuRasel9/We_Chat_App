import 'package:flutter/material.dart';
import 'package:we_chat/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To We Chat"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height*.15,
            left: mq.width*.25,

            width: mq.height*.50,


            child: Image.asset('assets/images/icon.png'))],
      ),
    );
  }
}
