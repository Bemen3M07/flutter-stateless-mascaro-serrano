import 'package:flutter/material.dart';
//main
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
