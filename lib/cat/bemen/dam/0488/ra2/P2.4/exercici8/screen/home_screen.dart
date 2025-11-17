import 'package:flutter/material.dart';

import '../pages/page1.dart'; // Pàgina 1: exercicis Stateless
import '../pages/page2.dart'; // Pàgina 2: exercicis Stateful

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    StatelessPage(),
    StatefulPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Pàgina 1\nStateless',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_clear),
            label: 'Pàgina 2\nStateful',
          ),
        ],
      ),
    );
  }
}
