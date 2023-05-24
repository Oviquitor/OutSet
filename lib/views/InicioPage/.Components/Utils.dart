import 'package:flutter/material.dart';

class Utils {
  bool validacampos(formkey) {
    if (formkey.currentState.validate()) {
      return true;
    }

    return false;
  }

  void mudarTela(tela, context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => tela),
    );
  }
//   final messengerKey = GlobalKey<ScaffoldMessengerState>();

//   static showSnackBar(String? text) {
//     if (text == null) return;

//     final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

//     messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }
}
