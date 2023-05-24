import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outset/components/custom_text.dart';
import 'package:outset/views/InicioPage/CadastroMain/CadastroController.dart';
import 'package:outset/views/InicioPage/LoginMain/Login.dart';
import '../.Components/Utils.dart';

class CadastroMain extends StatefulWidget {
  const CadastroMain({super.key});

  @override
  State<CadastroMain> createState() => _CadastroMainState();
}

class _CadastroMainState extends State<CadastroMain> {
  final formkey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  Utils util = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SizedBox(
                      child: Text(
                        'Olá,\nseja bem vindo\nao OutSet',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          height: 1,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 18)),
                    SizedBox(
                      child: Text(
                        'para acessar o aplicativo preencha todos os campos a baixo',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formkey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 80)),
                      //nome
                      CustomText(
                        icon: Icons.person,
                        label: 'Nome',
                        controller: _nomeController,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      //Email
                      TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
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
                      //Senha
                      TextFormField(
                        // icon: Icons.lock,
                        // isSecret: true,
                        controller: _senhaController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                        validator: (value) => value != null && value.length < 6
                            ? 'Mínimo 6 Caracteres'
                            : null,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      TextFormField(
                        // icon: Icons.lock,
                        // isSecret: true,
                        controller: _confirmarSenhaController,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirmar senha',
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            value == null || value != _senhaController.text
                                ? 'Ambas as Senhas Devem ser Iguais'
                                : null,
                      ),

                      const Padding(padding: EdgeInsets.only(top: 60)),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (util.validacampos(formkey)) {
                              cadastrar(_nomeController, _emailController, _senhaController, context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Criar usuario',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      const Padding(padding: EdgeInsets.only(top: 25)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            child: Text(
                              'Já tem uma conta?',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              util.mudarTela(LoginMain(), context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
