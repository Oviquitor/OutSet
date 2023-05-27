import 'package:outset/views/InicioPage/InicialMain/InicialMain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void desconectar(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    await pref.clear();
    mudarTela(InicialMain(), context);
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
