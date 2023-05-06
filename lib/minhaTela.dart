import 'package:flutter/material.dart';

class MinhaTela extends StatelessWidget {
  const MinhaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  // image: DecorationImage(
                    // image: AssetImage("assets/images/img.jpg"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: SizedBox(
                        child: Text(
                          'Um lugar qualquera',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        child: Text(
                          'Em uma ilha',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
