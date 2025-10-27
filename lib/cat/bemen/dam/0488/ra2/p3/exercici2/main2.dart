import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: Builder(
            builder: (innerContext) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome!', style: TextStyle(fontSize: 28)),
                const Text('Start learning now', style: TextStyle(fontSize: 25)),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(innerContext).showSnackBar(
                      const SnackBar(content: Text('Logging...'), duration: Duration(seconds: 2)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(innerContext).showSnackBar(
                      const SnackBar(content: Text('Registering...'), duration: Duration(seconds: 2)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
