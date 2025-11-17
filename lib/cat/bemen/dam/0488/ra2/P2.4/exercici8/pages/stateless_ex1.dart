import 'package:flutter/material.dart';

class StatelessEx1Page extends StatelessWidget {
  const StatelessEx1Page({super.key});

  @override
  Widget build(BuildContext context) {//widget unico
    return const MaterialApp(
      home: Scaffold(
        body: Center( // un unico objeto centrado
          child: Text('Hello World 1!'), //texto
        ),
      ),
    );
  }
}

