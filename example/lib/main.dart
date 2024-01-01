import 'dart:math';

import 'package:curved_gradient/curved_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: CurvedGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.white],
                  granularity: 50,
                  curveGenerator: (x) => pow(sin(x * pi), 2).toDouble(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: CurvedGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.white],
                  granularity: 50,
                  curveGenerator: (x) => pow(1 - x, 5).toDouble(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: CurvedGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.white],
                  stops: [0.2, 0.4],
                  granularity: 50,
                  curveGenerator: (x) => pow(1 - x, 5).toDouble(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: CurvedGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.white],
                  stops: [0, 0.1],
                  granularity: 4,
                  curveGenerator: (x) => x * x * x,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
