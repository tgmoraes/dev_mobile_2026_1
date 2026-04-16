import 'package:aula04_provider/pessoa.dart';
import 'package:aula04_provider/rotas.dart';
import 'package:aula04_provider/telaForm.dart';
import 'package:aula04_provider/telaLista.dart';
import 'package:aula04_provider/telaDetalhes.dart';
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
      create: (context) => ListaPessoas(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme:  ColorScheme.fromSeed(seedColor: Colors.yellowAccent)  ,
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


