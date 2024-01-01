import 'dart:math';

import 'package:curved_gradient/curved_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  print(CurvedGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.black, Colors.white],
    stops: [0, 1],
    granularity: 2,
    curveGenerator: (x) => x * x,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.white, Colors.black, Colors.black, Colors.white],
                    stops: [0, 0.05, 0.95, 1],
                  ),
                ),
              ),
            ),
            Container(height: 2, color: Colors.red),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: CurvedGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.white, Colors.black],
                    stops: [0, 1],
                    granularity: 100,
                    curveGenerator: (x) {
                      return 1.0-pow(2*(x-0.5), 50);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
