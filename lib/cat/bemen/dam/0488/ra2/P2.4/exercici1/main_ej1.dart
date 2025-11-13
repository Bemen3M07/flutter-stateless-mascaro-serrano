import 'package:flutter/material.dart'; // Importa la librería principal de Flutter para crear interfaces gráficas

void main() {
  // Función principal que se ejecuta al iniciar la app
  runApp(MaterialApp(
    home: GoodApp(), // Pantalla principal de la app
    debugShowCheckedModeBanner:
        false, // Quita la etiqueta "debug" de la esquina
  ));
}

class GoodApp extends StatefulWidget {
  // StatefulWidget porque el texto cambiará (estado dinámico)
  @override
  State<GoodApp> createState() => _GoodAppState(); // Crea el estado asociado
}

class _GoodAppState extends State<GoodApp> {
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
