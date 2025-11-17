import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const DiceHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DiceHomePage extends StatefulWidget {
  const DiceHomePage({super.key});

  @override
  State<DiceHomePage> createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {
  final Random _random = Random();
  int _left = 1;
  int _right = 1;

  void _rollDice() {
    setState(() {
      _left = _random.nextInt(6) + 1; // 1..6
      _right = _random.nextInt(6) + 1;
    });

    // Si són dos sis, toast "JACKPOT!"
    if (_left == 6 && _right == 6) {
      Fluttertoast.showToast(
        msg: "JACKPOT!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
      );
    }
  }

  // Retorna el camí a l'asset SVG corresponent (assets/dice1.svg .. dice6.svg)
  String _assetFor(int face) => 'assets/dado/dice$face.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fons i estil similar a l'exemple; posa aquí una imatge de fons si vols
      backgroundColor: const Color(0xFF0F4D3A), // fons verd fosc (canvia si vols)
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Botó superior com a barra
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _rollDice,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'ROLL THE DICE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Contenidor dels daus amb animació al canviar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAnimatedDice(_left, key: ValueKey('left_$_left')),
                    const SizedBox(width: 24),
                    _buildAnimatedDice(_right, key: ValueKey('right_$_right')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget per al dau amb AnimatedSwitcher per fer una transició suau
  Widget _buildAnimatedDice(int face, {required Key key}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 360),
      transitionBuilder: (child, animation) {
        // combinació d'opacitat i escala per a entrada/sortida
        return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
      },
      child: Container(
        key: key,
        width: 140,
        height: 140,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: SvgPicture.asset(
          _assetFor(face),
          width: 124,
          height: 124,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
