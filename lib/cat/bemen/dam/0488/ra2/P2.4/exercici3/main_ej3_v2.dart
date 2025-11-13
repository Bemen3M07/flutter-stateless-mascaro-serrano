import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: GuessApp(), debugShowCheckedModeBanner: false));
}

class GuessApp extends StatefulWidget {
  @override
  State<GuessApp> createState() => _GuessAppState();
}

class _GuessAppState extends State<GuessApp> {
  int secret = Random().nextInt(101); // numero aleatorio del 0 al 100
  String msg = '';
  String input = ''; // variable que gaurdará el input del user
  int intentos = 0; //variable que cuenta intetnos intentos

  void check() {
    final num = int.tryParse(input);
    if (num == null) {
      setState(() => msg = 'Introduce un número válido');
      return;
    }
    // comprobación de que el numero este denrto del rango 0-100
    if (num < 0 || num > 100) {
      setState(() => msg = 'El número está fuera del rango');
      return;
    }
    //comprobación de si el número introducido es más grande, más pequeño o acierto
    setState(() {
      if (num < secret) {
        msg = 'El número que buscas es más grande';
        intentos++; // suma uno a intentos cada vez que el user falla
      } else if (num > secret) {
        msg = 'El número que buscas es más pequeño';
        intentos++; // suma uno a intentos cada vez que el user falla
      } else {
        msg = 'Has acertado!';
      }
    });
  }
  //titulo 
  String text = 'Adivina el número';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold), //tamaño y estilo letra
            ),
            const SizedBox(height: 20),
            const Text('Introduce un número del 0 al 100:'),
            SizedBox(
              width: 250, // ancho cuadro texto
              height: 50, // alto cuadro texto
              child: TextField(
                onChanged: (v) => input = v, // se guarda el input del user en  'input'
                keyboardType:
                    TextInputType.number, // Solo permite numeros como entrada
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escribe aquí...',
                ),
              ),
            ),
            const SizedBox(height: 20),
            //boton para validar, llama a la función check que comprueba 
            //si se ha acertado el num o si es mas grande o mas pequeño
            ElevatedButton(onPressed: check, child: const Text('Validar')),
            const SizedBox(height: 20),
            //se imprime el mensaje que corresponda
            Text(msg, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            //se imprime el contador de intentos
            Text('Intentos: $intentos', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
