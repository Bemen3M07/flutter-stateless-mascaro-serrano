import 'package:flutter/material.dart';

class StatefulEx2Page extends StatefulWidget {
  const StatefulEx2Page({super.key});

  @override
  State<StatefulEx2Page> createState() => _StatefulEx2PageState();
}

class _StatefulEx2PageState extends State<StatefulEx2Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Say Hello App', // Título de la aplicación (usado por el sistema en algunos contextos)
      theme: ThemeData(primarySwatch: Colors.blueGrey), // Tema global: paleta base azul-gris
      home: SayHelloPage(), // Pantalla inicial de la app (widget stateful)
    );
  }
}

class SayHelloPage extends StatefulWidget {
  @override
  _SayHelloPageState createState() => _SayHelloPageState(); // Crea el estado asociado
}

class _SayHelloPageState extends State<SayHelloPage> {
  final TextEditingController _nameController = TextEditingController();
  // Controller para leer/escuchar el texto introducido en el TextField

  void _showWelcomeDialog() {
    final name = _nameController.text.trim().isEmpty
        ? ' - '
        : _nameController.text.trim();
    // Tomamos el texto del controlador, hacemos trim y si está vacío usamos ' - ' como valor por defecto

    const double topOffset = 500.0;
    // Offset vertical desde la parte superior para posicionar el diálogo más abajo/arriba según se desee.

    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Permite cerrar el diálogo tocando fuera de él
      barrierLabel: 'Cerrar', // Etiqueta accesible para el barrier
      barrierColor: Colors.black54, // Sombra / overlay detrás del diálogo
      transitionDuration: Duration(milliseconds: 250), // Duración de la animación de aparición
      pageBuilder: (context, animation, secondaryAnimation) {
        // pageBuilder debe devolver un widget que ocupe toda la pantalla.
        // Usamos Align + Padding para llevar el diálogo más arriba.
        return SafeArea(
          // SafeArea evita que el contenido quede bajo la barra de estado/notch
          child: Builder(
            builder: (context) {
              return Material(
                type: MaterialType.transparency,
                // Usamos Material transparente para poder dibujar un contenido con sombra/elevación
                child: Stack(
                  children: [
                    // El contenido alineado hacia arriba con un offset
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: topOffset, // desplazamiento desde la parte superior
                          left: 24,
                          right: 24,
                        ),
                        child: Material(
                          // Estilo del "card" que actúa como diálogo
                          color: Colors.grey[200],
                          elevation: 8, // sombra bajo el material para sensación flotante
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // bordes redondeados
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            width: double.infinity,
                            constraints: BoxConstraints(minHeight: 70), 
                            child: Text(
                              'HELLO $name', // Texto que muestra el saludo, con el nombre leído
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Si se quisiera añadir más elementos al stack (por ejemplo un botón de cerrar flotante) se haría aquí.
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose(); // Importante: liberar el controlador cuando el State se destruye
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo de la pantalla
      appBar: AppBar(title: Text('Say Hello'), elevation: 0), // AppBar con título y sin elevación
      body: Center(
        child: SingleChildScrollView(
          // Permite hacer scroll si el teclado aparece o en pantallas pequeñas
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ajusta la columna al tamaño mínimo necesario
            children: [
              // Bloque de texto
              TextField(
                controller: _nameController, // Conecta el TextField con el controlador
                decoration: InputDecoration(
                  labelText: 'Name', // Etiqueta superior del TextField
                  hintText: 'Introduce tu nombre', // Hint dentro del campo
                  filled: true,
                  fillColor: Colors.grey[200], // Color de fondo del TextField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Borde redondeado
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Botón que cuando pulsas muestra el diálogo
              ElevatedButton(
                onPressed: _showWelcomeDialog, // Llama a la función que muestra el diálogo
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 14.0,
                  ),
                  shape: StadiumBorder(), // Forma tipo "píldora"
                  backgroundColor: Color(0xFF233A50), // Color del botón
                ),
                child: Text(
                  'SayHello', // Texto del botón
                  style: TextStyle(
                    fontSize: 18, // tamaño de letra
                    fontWeight: FontWeight.bold, // negrita
                    letterSpacing: 1.2, // espacio entre letras
                    color: Colors.white, // color del texto
                    fontFamily: 'Roboto', // fuente personalizada si la tienes
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
