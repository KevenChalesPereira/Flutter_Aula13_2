import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aula13_2/dados.dart';
import 'package:flutter_aula13_2/dados_json.dart';

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
  late Future<DadosJSON> meusDados;

  @override
  void initState() {
    super.initState();
    meusDados = buscaDados();
  }

  Future<DadosJSON> buscaDados() async {
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
          child: FutureBuilder<DadosJSON>(
            future: meusDados,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Exibir um indicador de carregamento enquanto espera os dados
              } else if (snapshot.hasError) {
                return Text('Erro ao carregar dados: ${snapshot.error}');
              } else {
                return Text(snapshot
                    .data!.s2); // Exibir os dados quando estiverem prontos
              }
            },
          ),
        ),
      ),
    );
  }
}
