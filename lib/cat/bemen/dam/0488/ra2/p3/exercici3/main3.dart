import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is a resource string',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage('assets/img/mono.png'),
                width: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
