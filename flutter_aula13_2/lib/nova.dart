import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aula13_2apagar/dados.dart';
import 'package:flutter_aula13_2apagar/dados_json.dart';

class Nova extends StatefulWidget {
  const Nova({super.key});

  @override
  State<Nova> createState() => _NovaState();
}

// Preparando para receber dados no futuro
Future<String> carregaDados() async {
  return Dados.original;
}


class _NovaState extends State<Nova> {
  late DadosJSON meusDados;

  @override
  void initState() async {
    meusDados = await buscaDados();
    super.initState();
  }

  Future buscaDados() async {
    String original = await carregaDados();
    final decodificada = json.decode(original);
    return DadosJSON.fromJson(decodificada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Filme'),
        ),
        body: Center(
          // nomes virão de outro lugar
          child: Text(meusDados.s2),
        ),
      ),
    );
  }
}
