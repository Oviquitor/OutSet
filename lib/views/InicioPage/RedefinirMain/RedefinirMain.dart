import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../.Components/Utils.dart';
import 'RedefinirController.dart';

class RedefinirMain extends StatefulWidget {
  const RedefinirMain({super.key});

  @override
  State<RedefinirMain> createState() => _RedefinirMainState();
}

class _RedefinirMainState extends State<RedefinirMain> {
  final formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  Utils util = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: const Text(
                      'Redefinir Senha',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 200)),
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      labelText: 'Email',
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Insira um Email Valido'
                            : null,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (util.validacampos(formkey)) {
                          redefinirSenha(_emailController);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Confirmar email',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
