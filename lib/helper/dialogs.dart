import 'package:flutter/material.dart';

class Dialogs {

  //snackbar
  static void showSnackBar(BuildContext context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue.withOpacity(.8),
      //space between bottom and snackbar
      behavior: SnackBarBehavior.floating,
    ));
  }


  static void showProgressBar(BuildContext context){
    showDialog(context: context, builder:(_)=> const Center(child: CircularProgressIndicator()));
  }

}
