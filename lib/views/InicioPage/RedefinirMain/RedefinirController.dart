import 'package:firebase_auth/firebase_auth.dart';

Future redefinirSenha(emailcontroller) async {
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailcontroller.text.trim());
    print('Email Enviado');
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}
