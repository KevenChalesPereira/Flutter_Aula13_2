import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_aula13_2/dados_json.dart';

class Nova extends StatefulWidget {
  const Nova({super.key});

  @override
  State<Nova> createState() => _NovaState();
}

// Preparando para receber dados no futuro

Future<String> _carregaDadosRemotos() async {
  final response = await (http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')));
  if (response.statusCode == 200) {
    print('response statusCode is 200');
    return response.body;
  } else {
    print('Http Error: ${response.statusCode}!');
    throw Exception('Invalid data source.');
  }
}

class _NovaState extends State<Nova> {
  late Future<DadosJSON> meusDados;

  @override
  void initState() {
    super.initState();
    meusDados = buscaDados();
  }

  Future<DadosJSON> buscaDados() async {
    String original = await _carregaDadosRemotos();
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
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Dados: ${snapshot.data!.s1}');
              }
            },
          ),
        ),
      ),
    );
  }
}
