import 'package:flutter/material.dart';

void main() {
  runApp(const BurgerApp());
}

class BurgerApp extends StatelessWidget {
  const BurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burger App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Burger App"),
        ),
      ),
    );
  }
}
