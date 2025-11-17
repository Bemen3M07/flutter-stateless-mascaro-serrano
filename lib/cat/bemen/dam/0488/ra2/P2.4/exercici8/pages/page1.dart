import 'package:flutter/material.dart';

import 'stateless_ex1.dart';
import 'stateless_ex2.dart';
import 'stateless_ex3.dart';
import 'stateless_ex4.dart';
import 'stateless_ex5.dart';
import 'stateless_ex6.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercicis Stateless'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Ex 1'),
              Tab(text: 'Ex 2'),
              Tab(text: 'Ex 3'),
              Tab(text: 'Ex 4'),
              Tab(text: 'Ex 5'),
              Tab(text: 'Ex 6'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StatelessEx1Page(),
            StatelessEx2Page(),
            StatelessEx3Page(),
            StatelessEx4Page(),
            StatelessEx5Page(),
            StatelessEx6Page(),
          ],
        ),
      ),
    );
  }
}
