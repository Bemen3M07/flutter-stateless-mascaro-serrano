import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Say Hello App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: SayHelloPage(),
    );
  }
}

class SayHelloPage extends StatefulWidget {
  @override
  _SayHelloPageState createState() => _SayHelloPageState();
}

class _SayHelloPageState extends State<SayHelloPage> {
  final TextEditingController _nameController = TextEditingController();

  void _showWelcomeDialog() {
    final name = _nameController.text.trim().isEmpty
        ? ' - '
        : _nameController.text.trim();

    const double topOffset = 500.0;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Cerrar',
      barrierColor: Colors.black54, // sombra detrás del diálogo
      transitionDuration: Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        // pageBuilder debe devolver un widget que ocupe toda la pantalla.
        // Usamos Align + Padding para situar el diálogo más arriba.
        return SafeArea(
          child: Builder(
            builder: (context) {
              return Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: [
                    // El contenido (el diálogo) alineado hacia arriba con un offset
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: topOffset,
                          left: 24,
                          right: 24,
                        ),
                        child: Material(
                          // Material para que tenga sombra y aspecto de diálogo
                          color: Colors.grey[200],
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            width: double.infinity,
                            // El tamaño mínimo para que no sea demasiado pequeño
                            constraints: BoxConstraints(minHeight: 70),
                            child: Text(
                              'HELLO $name',
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
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Say Hello'), elevation: 0),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Campo de texto
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Introduce tu nombre',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Botón para mostrar el diálogo
              ElevatedButton(
                onPressed: _showWelcomeDialog,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 14.0,
                  ),
                  shape: StadiumBorder(),
                  backgroundColor: Color(0xFF233A50),
                ),
                child: Text(
                  'SayHello',
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