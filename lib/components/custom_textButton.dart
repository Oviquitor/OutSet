import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String texto;
  double size;
  CustomTextButton({super.key, required this.texto, required this.size});

  @override
  Widget build(BuildContext context) {
    return Align(
      
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          texto,
          style: TextStyle(
            color: const Color.fromARGB(255, 189, 0, 79),
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
