import 'package:flutter/material.dart';
import 'package:flutter_aula13_2apagar/nova.dart';

void main() {
  runApp(const Nova());
}

class MainApp extends StatelessWidget {
  List<String> nomes = ['Darth Vader', 'Ben Solo', 'Luke Skywalker'];

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(nomes[0]),
        ),
      ),
    );
  }
}
