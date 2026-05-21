import 'package:aula06_uso_api/providers/pessoa_provider.dart';
import 'package:aula06_uso_api/util/rotas.dart';
import 'package:aula06_uso_api/telas/tela_form.dart';
import 'package:aula06_uso_api/telas/tela_lista.dart';
import 'package:aula06_uso_api/telas/tela_detalhes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PessoaProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme:  ColorScheme.fromSeed(seedColor: Colors.purple)  ,
        ),
        home: TelaLista(titulo: 'Lista Pessoas'),
        routes: {
          Rotas.telaDetalhes : (context) => TelaDados(titulo: "Detalhes pessoa"), 
          Rotas.telaForm : (context) => TelaForm(titulo: 'Adicionar pessoa'),
        },
      ),
    );
  }
}


