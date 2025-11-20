import 'dart:math';

import 'package:empty/cat/bemen/dam/0488/ra2/P2.4/exercici4/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StatefulEx4Page extends StatefulWidget {
  const StatefulEx4Page({super.key});

  @override
  State<StatefulEx4Page> createState() => _StatefulEx4PageState();
}

class _StatefulEx4PageState extends State<StatefulEx4Page> {
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

  String _assetFor(int face) => 'assets/dado/dice$face.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Aquí ponemos la imagen de fondo (cover para llenar toda la pantalla)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dado/tapestry.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Mantener una capa semitransparente si quieres que los controles resalten
        child: Container(
          color: Colors.black.withOpacity(0.18), // opcional: máscara para contraste
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _rollDice,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
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
        ),
      ),
    );
  }

  Widget _buildAnimatedDice(int face, {required Key key}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 360),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
      },
      child: Container(
        key: key,
        child: SvgPicture.asset(
          _assetFor(face),
          width: 184,
          height: 184,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}