import 'package:flutter/material.dart';

class StatefulEx5Page extends StatefulWidget {
  const StatefulEx5Page({super.key});

  @override
  State<StatefulEx5Page> createState() => _StatefulEx5PageState();
}

class _StatefulEx5PageState extends State<StatefulEx5Page> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Aquí va l\'exercici Stateful 5'),
    );
  }
}
