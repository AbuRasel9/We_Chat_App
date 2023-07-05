import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:we_chat/main.dart';
import 'package:we_chat/widget/elevated_button_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {





  bool isAnimate=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 500),(){
      setState(() {
        isAnimate=true;
      });


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
          AnimatedPositioned(

              top: mq.height * .15,

              right: isAnimate? mq.width * .25 : -mq.width*.5,
              width: mq.height * .35,
              duration: Duration(seconds: 1),
              child: Image.asset('images/icon.png')),
          //google button
          Positioned(
              bottom: mq.height * .10,
              left: mq.width * .06,
              width: mq.height * .40,
              height: mq.height * .07,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('images/google.png',height: mq.height*.06,),

                //RichText use for multiple style use in text
                label: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black,fontSize: 19),
                      children: [
                        TextSpan(text: "Sign With ",),
                        TextSpan(text: "Google",style:TextStyle(fontWeight: FontWeight.w500))


                  ]),
                ),
                style: AppButtonStyle(),
              )),
        ],
      ),
    );
  }
}
