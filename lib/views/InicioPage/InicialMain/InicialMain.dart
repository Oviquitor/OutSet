import 'package:flutter/material.dart';
import 'package:outset/components/custom_textButton.dart';
import 'package:outset/views/InicioPage/CadastroMain/CadastroMain.dart';
import 'package:outset/views/InicioPage/LoginMain/Login.dart';

class InicialMain extends StatelessWidget {
  const InicialMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Center(
              child: Container(
                width: 250,
                height: 380,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/OutSet.png"),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Entrar
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => LoginMain()),
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                //Criar Conta
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => CadastroMain()),
                        ),
                      );
                    },
                  ),
                ),
                //const Padding(padding: EdgeInsets.only(top: 100)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     CustomTextButton(texto: 'Termos de Uso', size: 18),
                //     const Text(
                //       '|',
                //       style: TextStyle(
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     CustomTextButton(texto: 'Privacidade', size: 18),
                //   ],
                // ),
                //Botoes redondo
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Ou'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/OutSet.png"),
                      ),
                      Padding(padding: EdgeInsets.only(left: 50)),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/OutSet.png"),
                      ),
                      Padding(padding: EdgeInsets.only(left: 50)),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/OutSet.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
