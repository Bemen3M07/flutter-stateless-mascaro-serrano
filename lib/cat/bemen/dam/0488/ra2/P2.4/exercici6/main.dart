import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); // Punto de entrada: ejecuta la app

// Modelo simple que representa un item de la lista de la compra
class Item {
  final String name;
  final int amount;
  Item({required this.name, required this.amount});
}

// Widget raíz de la aplicación (sin estado)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        useMaterial3: false, // desactiva Material 3 (usa M2 styling)
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7), // color de fondo global
      ),
      home: const ShoppingListPage(), // pantalla principal
    );
  }
}

// Página principal (con estado) que contiene la lógica de la lista
class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  // Controladores para los TextField (nombre y cantidad)
  final _nameCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();

  // Lista donde se guardan los items
  final List<Item> _items = [];

  @override
  void dispose() {
    // Liberar los controladores cuando el widget se destruya para evitar fugas de memoria
    _nameCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  // Función que añade un item validando entrada
  void _addItem() {
    final name = _nameCtrl.text.trim();

    // Intenta parsear la cantidad; si el campo está vacío lo trata como '0'
    final amount = int.tryParse(_amountCtrl.text.trim() == '' ? '0' : _amountCtrl.text.trim()) ?? 0;

    // Validación: nombre no vacío y cantidad > 0
    if (name.isEmpty || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introduce un nombre y una cantidad válida.')),
      );
      return;
    }

    // Si pasa la validación, actualizamos el estado
    setState(() {
      _items.insert(0, Item(name: name, amount: amount)); // inserta al principio (top)
      _nameCtrl.clear();   // limpia el campo de nombre
      _amountCtrl.clear(); // limpia el campo de cantidad
    });
    // Cierra el teclado
    FocusScope.of(context).unfocus();
  }

  // Construye la tarjeta con los TextField y el botón "Add"
  Widget _buildInputCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(20, 30, 60, 0.06), blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Campo para el nombre
          TextField(
            controller: _nameCtrl,
            decoration: InputDecoration(
              labelText: 'Name',
              filled: true,
              fillColor: const Color(0xFFECEFF1),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 12),
          // Campo para la cantidad (solo números)
          TextField(
            controller: _amountCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
              filled: true,
              fillColor: const Color(0xFFECEFF1),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 14),
          // Botón para añadir el item
          SizedBox(
            width: 92,
            height: 36,
            child: ElevatedButton(
              onPressed: _addItem,
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 2,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              ),
              child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }

  // Construye la vista de cada elemento de la lista
  Widget _buildListItem(Item item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFECEFF1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Nombre a la izquierda (usa Expanded para ocupar el espacio disponible)
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          // Cantidad en una cajita a la derecha
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              item.amount.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Construye la vista de lista completa; si está vacía muestra un mensaje
  Widget _buildListView() {
    if (_items.isEmpty) {
      return const Center(
        child: Text('La lista está vacía. Añade elementos.'),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 18),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return _buildListItem(item);
      },
    );
  }

  // Build principal del StatefulWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No hay AppBar por intención estética (comentado)
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),
            // Tarjeta de entrada centrada horizontalmente por los márgenes del Container
            _buildInputCard(),
            const SizedBox(height: 18),
            // Lista expandible que ocupa el resto del espacio
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 6),
                child: _buildListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
