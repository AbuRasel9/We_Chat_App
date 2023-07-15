

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_chat/Screens/auth/login_screens.dart';
import 'package:we_chat/Screens/profileScreen.dart';
import 'package:we_chat/api/api.dart';
import 'package:we_chat/models/chat_user.dart';
import 'package:we_chat/widgets/ReUseAbleCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        //Home button add in
        leading: const Icon(
          Icons.home,
        ),
        title: const Text("We Chat"),
        actions: [
          //search button
          IconButton(
            disabledColor: Colors.greenAccent,
            onPressed: () {},
            icon: const Icon(Icons.search),
            hoverColor: Colors.greenAccent,
          ),
          //logout button
          IconButton(
            onPressed: () async {
              //signout if i click this button it's go to again login screen
              await APIs.Auth.signOut();
              await GoogleSignIn().signOut();
              setState(() {
                Get.offAll(const LoginScreen());
              });
            },
            icon: const Icon(Icons.login_outlined),
            hoverColor: Colors.greenAccent,
          ),
          //more feture button
          IconButton(
            onPressed: () {
              Get.to( ProfileScreen(user:list[0],));
            },
            icon: const Icon(Icons.more_vert),
            hoverColor: Colors.greenAccent,
          )
        ],
      ),
      //floating acction button add for add user
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          child: const Icon((Icons.add_comment_rounded)),
          onPressed: () {

          },
        ),
      ),
      //use StreamBuilder for get real time data form firebase
      body: StreamBuilder(
          //get data form firebase collection
          stream: APIs.Firestore.collection("users").snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              //if some or all data is loaded then show it
              case ConnectionState.active:
              case ConnectionState.done:
                final Data = snapshot.data?.docs;
                list = Data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];

                if (list.isNotEmpty) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: .001),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return  ReUseAbleCard(user: list[index],);
                      });

                }else{
                  return const Center(child: Text("No Connection Found!",style: TextStyle(fontSize: 20),),);
                }
            }
          }),
    );
  }
}
