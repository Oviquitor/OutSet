import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outset/views/InicioPage/.Components/Utils.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

getDados() {
  User? user = _auth.currentUser;
  if (user != null) {
    String? displayName = user.displayName;
    return displayName;
  }
  return '';
}

class MinhaTela extends StatefulWidget {
  const MinhaTela({super.key});

  @override
  State<MinhaTela> createState() => _MinhaTelaState();
}

class _MinhaTelaState extends State<MinhaTela> {
  String usuario = getDados();
  Utils util = new Utils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  usuario,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: () async {
                    util.desconectar(context);
                  },
                  child: Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
