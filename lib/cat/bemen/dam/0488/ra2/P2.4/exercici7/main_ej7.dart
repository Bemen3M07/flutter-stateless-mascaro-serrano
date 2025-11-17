import 'package:empty/cat/bemen/dam/0488/ra2/P2.4/exercici7/providers/counter_provider.dart';
import 'package:empty/cat/bemen/dam/0488/ra2/P2.4/exercici7/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CounterProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Counter',
      theme: ThemeData(primarySwatch: Colors.purple),

      home: const HomeScreen(),
    );
  }
}
