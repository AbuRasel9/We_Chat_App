import 'package:flutter/material.dart';

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.greenAccent.shade100,
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),

    ),
    padding: EdgeInsets.only(bottom: 10,top: 10),
    elevation: 1,


  );
}