import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Item {
  final String name;
  final int amount;
  Item({required this.name, required this.amount});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
      ),
      home: const ShoppingListPage(),
    );
  }
}

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final _nameCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final List<Item> _items = [];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  void _addItem() {
    final name = _nameCtrl.text.trim();
    final amount = int.tryParse(_amountCtrl.text.trim() == '' ? '0' : _amountCtrl.text.trim()) ?? 0;

    if (name.isEmpty || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introduce un nombre y una cantidad válida.')),
      );
      return;
    }

    setState(() {
      _items.insert(0, Item(name: name, amount: amount)); // insert at top
      _nameCtrl.clear();
      _amountCtrl.clear();
    });
    // Cierra el teclado
    FocusScope.of(context).unfocus();
  }

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
          // Name field
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
          // Amount field
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
          // Nombre a la izquierda
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          // Cantidad a la derecha
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar si quieres, lo dejo sin AppBar para parecerse más a la captura
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),
            // Input card centrado horizontalmente
            _buildInputCard(),
            const SizedBox(height: 18),
            // Lista de items (expandible)
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
