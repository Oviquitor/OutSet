import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:outset/components/custom_text.dart';
import 'package:outset/components/custom_textButton.dart';
import 'package:outset/views/InicioPage/LoginMain/LoginController.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final firebaseAuth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              //Texto Custom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 70)),
                  Container(
                    child: Column(
                      children: [
                        const Align(
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 40,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Olá, bem vindo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          child: Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Entre com a sua conta OutSet',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(padding: EdgeInsets.only(top: 180)),
                  //Email
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  //Senha
                  CustomText(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                    controller: _senhaController,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Checkbox(
                          value: _isChecked,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: const Text(
                          'Manter-me logado',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      CustomTextButton(texto: 'Esqueceu a senha?', size: 15),
                    ],
                  ),

                  const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                  //Botao Entrar
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        logar(
                          _emailController, _senhaController, context
                        );
                      },
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: Text(
                          'Ainda não tem uma conta?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      CustomTextButton(texto: 'Cadastrar', size: 15),
                    ],
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