import 'package:flutter/material.dart';

class StatefulEx1Page extends StatefulWidget {
  const StatefulEx1Page({super.key});

  @override
  State<StatefulEx1Page> createState() => _StatefulEx1PageState();
}

class _StatefulEx1PageState extends State<StatefulEx1Page> {
String text = 'Good ****!'; // Texto inicial

  @override
  Widget build(BuildContext context) {
    // interfaz
    return Scaffold(
      body: Center(
        // todos los elementos en una columna para que esten unos debajo de otros
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // objetos centrados en pantalla
          children: [
            // los 3 objetos que estan en pantalla, texto inicial y dos botones
            Text(
              text,
              style: TextStyle(fontSize: 24), //tamaño letra
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // Boton con texto morning
              onPressed: () => setState(() =>
                  text = 'Good morning!'), //modificacion de 'text' al apretar
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey, // Color del botón
                foregroundColor: Colors.white, // Color del texto dentro
              ),
              child: Text('Morning'), //texto denrto del boton
            ),
            SizedBox(height: 10),//separador
            ElevatedButton(
              // Boton con texto night
              onPressed: () => setState(() =>
                  text = 'Good night!'), //modificacion de 'text' al apretar
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey, // Color del botón
                foregroundColor: Colors.white, // Color del texto dentro
              ),
              child: Text('Night'), //texto denrto del boton
            ),
          ],
        ),
      ),
    );
  }
}
