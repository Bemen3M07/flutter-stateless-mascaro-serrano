import 'package:flutter/material.dart';

void main() {
  runApp(const MyCounterApp());
}

class MyCounterApp extends StatefulWidget {
  const MyCounterApp({super.key});

  @override
  State<MyCounterApp> createState() => _MyCounterAppState();
}

class _MyCounterAppState extends State<MyCounterApp> {
  // puntuacion inicial a 0 
  int teamA = 0;
  int teamB = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Contenido principal
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            //MARCADOR 
            // se muestran las dos puntuaciones 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$teamA",
                  style: const TextStyle(fontSize: 30),
                ),
                Text(
                  "$teamB",
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // BOTONES
            // Se crean los dos botones, cada uno suma a un equipo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botón para sumar puntos al equipo A
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Se actualiza sumando un punto
                    setState(() {
                      teamA++;
                    });
                  },
                  child: const Text(
                    "Score",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // Botón para sumar puntos al equipo B
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Se actualiza sumando un punto
                    setState(() {
                      teamB++;
                    });
                  },
                  child: const Text(
                    "Score",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
