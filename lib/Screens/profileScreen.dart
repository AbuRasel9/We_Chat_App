import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:we_chat/models/chat_user.dart';

import '../api/api.dart';
import '../main.dart';
import 'auth/login_screens.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
        appBar: AppBar(
          //Home button add in
          title: const Text("Profile Screen"),
        ),
        //floating acction button add for add user
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton.extended(
              backgroundColor: Colors.redAccent.shade200,
              icon: const Icon(Icons.login_outlined),
              label: const Text("Logout"),
              onPressed: () async {
                //signout if i click this button it's go to again login screen
                await APIs.Auth.signOut();
                await GoogleSignIn().signOut();
                Get.offAll(LoginScreen());
              }),
        ),
        //use StreamBuilder for get real time data form firebase
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
            child: Column(
              children: [
                //for adding some space
                SizedBox(
                  width: mq.width,
                  height: mq.height * .06,
                ),
                //user profile
                ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height * .1),
                  //user profile picture
                  child: CachedNetworkImage(
                    width: mq.height * .2,
                    height: mq.height * .2,
                    fit: BoxFit.fill,
                    imageUrl: widget.user.image,
                    errorWidget: (context, url, error) => const CircleAvatar(
                      child: Icon(CupertinoIcons.person),
                    ),
                  ),
                ),

                //for adding some space
                SizedBox(
                  width: mq.width,
                  height: mq.height * .06,
                ),
                Text(
                  widget.user.email,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                //user name

                TextFormField(
                  initialValue: widget.user.name,
                  //decoration form feild
                  decoration: InputDecoration(
                      hintText: "eg.Abu Rasel",
                      label: Text("Name"),
                      //prefix icon in starting in the box
                      prefixIcon: const Icon(Icons.person, color: Colors.blue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 12,
                ),

                //about in user
                TextFormField(
                  initialValue: widget.user.about,
                  //decoration form feild
                  decoration: InputDecoration(
                      hintText: "eg.Hey,I'am Using We Chat",
                      label: const Text("About"),
                      //prefix icon in starting in the box
                      prefixIcon:
                          const Icon(Icons.info_outline, color: Colors.blue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

                //some space
                const SizedBox(height: 25,),
                SizedBox(
                  width:double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,size: 25,
                    ),
                    label: Text("Update",style: TextStyle(fontSize: 20),),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
