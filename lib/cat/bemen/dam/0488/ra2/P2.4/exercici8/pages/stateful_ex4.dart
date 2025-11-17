import 'package:flutter/material.dart';

class StatefulEx4Page extends StatefulWidget {
  const StatefulEx4Page({super.key});

  @override
  State<StatefulEx4Page> createState() => _StatefulEx4PageState();
}

class _StatefulEx4PageState extends State<StatefulEx4Page> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Aquí va l\'exercici Stateful 4'),
    );
  }
}
