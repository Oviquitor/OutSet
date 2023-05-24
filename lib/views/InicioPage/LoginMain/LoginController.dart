import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outset/minhaTela.dart';

Future logar(emailcontroller, senhacontroller, context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: senhacontroller.text.trim(),
    );
    if (userCredential != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MinhaTela()),
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