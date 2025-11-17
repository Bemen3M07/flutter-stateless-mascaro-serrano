import 'package:flutter/material.dart';

import 'stateful_ex1.dart';
import 'stateful_ex2.dart';
import 'stateful_ex3.dart';
import 'stateful_ex3_v2.dart';
import 'stateful_ex4.dart';
import 'stateful_ex5.dart';
import 'stateful_ex6.dart';

class StatefulPage extends StatelessWidget {
  const StatefulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercicis Stateful'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Ex 1'),
              Tab(text: 'Ex 2'),
              Tab(text: 'Ex 3'),
              Tab(text: 'Ex 3 v2'),
              Tab(text: 'Ex 4'),
              Tab(text: 'Ex 5'),
              Tab(text: 'Ex 6'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StatefulEx1Page(),
            StatefulEx2Page(),
            StatefulEx3Page(),
            StatefulEx3v2Page(),
            StatefulEx4Page(),
            StatefulEx5Page(),
            StatefulEx6Page(),
          ],
        ),
      ),
    );
  }
}
