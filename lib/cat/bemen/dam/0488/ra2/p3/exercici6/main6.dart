import 'package:flutter/material.dart';

//funcion para crear un mensaje con un nombre y un texto
class Message {
  final String author;
  final String body;

  Message(this.author, this.body);
}

void main() {
  runApp(const MainApp());
}
//main
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {//widget unico
    // lista nombres
    final names = [
      "Ellison Curry",
      "Briggs Willis",
      "Alexa Murphy",
      "Cameron Berry",
      "Annabelle Villarreal",
      "Nikolai Wiley",
      "Lauryn Morrow",
      "Kyree Hardy",
      "Wells Wilson",
      "Luna Foster",
      "Kayden Taylor",
      "Sofia Mann",
      "Nehemiah Randall",
      "Christina Gordon",
      "Karter Kramer",
      "Hanna Morales",
      "Megan Delarosa",
      "Osiris Johnson",
      "Emma Atkins",
      "Cason McKee",
      "Kori Walls",
      "Larry Shepherd",
    ];

    // mensaje de cada tarjeta
    const body =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";
    
    //crer el mensaje completo con nombre y body
    final messages = names.map((name) => Message(name, body)).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Message List'), // Título centrado
          centerTitle: true,
          // Acciones en la AppBar (iconos visuales sin funcionalidad)
          actions: [
            IconButton(
              onPressed: null, // Sin funcionalidad (solo visual)
              icon: const Icon(Icons.search),
              tooltip: 'Cerca',
            ),
            IconButton(
              onPressed: null, // Sin funcionalidad (solo visual)
              icon: const Icon(Icons.more_vert),
              tooltip: 'Més',
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[index];
            return Card( //formato de cada tarjeta
              color: Colors.grey[300],
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(msg.author,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)), //formato del texto
                    const SizedBox(height: 5),
                    Text(msg.body),
                  ],
                ),
              ),
            );
          },
        ),
        //boton que solo imprime texto en consola
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Boton apretado'); //al apretar imprime 'Boton apretado' en consola
          },
          child: const Icon(Icons.add), //icono del boton (boton tipo +)
        ),
      ),
    );
  }
}
