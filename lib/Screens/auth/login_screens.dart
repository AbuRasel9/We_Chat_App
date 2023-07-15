import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_chat/Screens/home_screens.dart';
import 'package:we_chat/api/api.dart';
import 'package:we_chat/helper/dialogs.dart';
import 'package:we_chat/main.dart';
import 'package:we_chat/widgets/elevated_button_style.dart';

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


//Hangle Google login button click
  _handleGoogleBtnClick(){
    //for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) async {
      //for hiding progressbar
      Navigator.pop(context);
      if(user !=null){


        log("user ${user.user}");
        log("additionalInformation:${user.additionalUserInfo}");

        if( (await APIs.userExists())){
          //navigate to home screen
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

        }else{
          APIs.createUser().then((value){
            //navigate to home screen
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

          });
        }


      }

    });

  }




  Future<UserCredential?> _signInWithGoogle() async {
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      log("_signInWithGoogle$e");
      Dialogs.showSnackBar(context,"Something went wrong( Check Internet !)");

      return null;

    }
  }



  @override

  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    //mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To We Chat"),
      ),
      body: Stack(
        children: [
          //app logo
          AnimatedPositioned(

              top: mq.height * .15,

              right: isAnimate? mq.width * .13 : -mq.width*.5,
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
                onPressed: () {
                  _handleGoogleBtnClick();

                },
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
