import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_chat/models/chat_user.dart';

class APIs {
  //for authentication
  static FirebaseAuth Auth = FirebaseAuth.instance;

  //for accessing cloud firestore database
  static FirebaseFirestore Firestore = FirebaseFirestore.instance;

  //for checking if users exists or not

  static Future<bool> userExists() async {
    return (await Firestore.collection('users')
        .doc(Auth.currentUser!.uid)
        .get())
        .exists;
  }

  //to return current user
  static User get user => Auth.currentUser!;

//for creating new user

  static Future<void> createUser() async {
    final time = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    final newUser = ChatUser(image: user.photoURL.toString(),
        about: "Hey,Iam using We chat!",
        name: user.displayName.toString(),
        createdAt: time,
        id: user.uid,
        isOnline: false,
        lastActive: time,
        pushToken: "",
        email: user.email.toString());

        return await Firestore.collection('users').doc(user.uid).set(newUser.toJson());




        }
}
