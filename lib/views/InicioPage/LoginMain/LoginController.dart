import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outset/minhaTela.dart';

Future logar(emailcontroller, senhacontroller, check, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller,
      password: senhacontroller,
    );
    if (userCredential != null) {
      if (check == true) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("email", emailcontroller);
        await pref.setString("senha", senhacontroller);
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MinhaTela()),
      );
    }
  } on FirebaseAuthException catch (e) {
    // String msg = '';
    // if (e.code == 'user-not-found') {
    //   msg = 'Usuário Não Encontrado';
    // } else if (e.code == 'wrong-password') {
    //   msg = 'Senha Incorreta';
    // } else {
    //   msg = 'Erro Não Definido';
    // }
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text(msg)),
    // );

    // Util.showSnackBar(e.message);
  }
}
