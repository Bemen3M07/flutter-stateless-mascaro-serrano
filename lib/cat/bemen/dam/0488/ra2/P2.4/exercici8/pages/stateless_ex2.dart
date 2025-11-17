import 'package:flutter/material.dart';

class StatelessEx2Page extends StatelessWidget {
  const StatelessEx2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // SizedBox.expand hace que el child ocupe todo el espacio disponible
        body: SizedBox.expand(
          // Builder crea un nuevo BuildContext que está DENTRO del Scaffold.
          // Esto es importante porque luego usamos ScaffoldMessenger.of(innerContext)
          // para mostrar SnackBars. Si usáramos el context del build() de arriba,
          // ese context estaría por fuera del Scaffold y no encontraría el ScaffoldMessenger.
          child: Builder(
            builder: (innerContext) => Column(
              // Centra verticalmente los hijos dentro de la columna
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text widgets son constantes
                const Text('Welcome!', style: TextStyle(fontSize: 28)),
                const Text('Start learning now',
                    style: TextStyle(fontSize: 25)),
                // SizedBox añade espacio vertical entre los textos y los botones
                const SizedBox(height: 50),
                // Botón "Login"
                ElevatedButton(
                  onPressed: () {
                    // Al pulsar, mostramos un SnackBar usando el innerContext
                    // ScaffoldMessenger busca el Scaffold más cercano y muestra el mensaje
                    ScaffoldMessenger.of(innerContext).showSnackBar(
                      const SnackBar(
                        content: Text('Logging...'),
                        duration: Duration(seconds: 2), // duración del SnackBar
                      ),
                    );
                  },
                  // Utilizamos styleFrom para dar color al boton
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // color de fondo del botón
                    foregroundColor: Colors.white, // color del texto
                  ),
                  child: const Text('Login'),
                ),
                // Espacio pequeño entre botones
                const SizedBox(height: 10),

                // Botón "Register"
                ElevatedButton(
                  onPressed: () {
                    // SnackBar diferente para este botón (cambia solo el texto que muestra)
                    ScaffoldMessenger.of(innerContext).showSnackBar(
                      const SnackBar(
                        content: Text('Registering...'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
