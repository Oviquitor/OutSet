import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outset/views/InicioPage/LoginMain/login.dart';

Future cadastrar(
    nomecontroller, emailcontroller, senhacontroller, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text.trim(),
      password: senhacontroller.text.trim(),
    );
    User? user = userCredential.user;
    await user?.updateDisplayName(nomecontroller.text.trim());

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginMain()),
    );
  } on FirebaseAuthException catch (e) {
    print(e);

    // Utils.showSnackBar(e.message);
  }
}
