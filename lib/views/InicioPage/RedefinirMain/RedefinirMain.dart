import 'package:flutter/material.dart';
import 'package:outset/components/custom_text.dart';

class RedefinirMain extends StatefulWidget {
  const RedefinirMain({super.key});

  @override
  State<RedefinirMain> createState() => _RedefinirMainState();
}

class _RedefinirMainState extends State<RedefinirMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
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
                const CustomText(
                  icon: Icons.email,
                  label: "Email",
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Confirmar email',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
