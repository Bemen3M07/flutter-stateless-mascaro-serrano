import 'package:flutter/material.dart';

class StatelessEx4Page extends StatelessWidget {
  const StatelessEx4Page({super.key});


  @override
  Widget build(BuildContext context) {
    // Creamos un objeto de tipo Contacto con la información del ejercicio
    const contact = Contacto(
      nombre: 'Marta Casserres',
      email: 'marta@example.com',
      tel: '934748474',
    );

    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: Builder(
            builder: (innerContext) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen circular
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/img/mono.png'),
                ),

                const SizedBox(height: 15),

                // Nombre completo
                Text(
                  contact.nombre,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Caja gris con email y teléfono
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email, size: 20),
                          const SizedBox(width: 8),
                          Text(contact.email),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.phone, size: 20),
                          const SizedBox(width: 8),
                          Text(contact.tel),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Clase Contact con tres atributos
class Contacto {
  final String nombre;
  final String email;
  final String tel;

  const Contacto({
    required this.nombre,
    required this.email,
    required this.tel,
  });
}