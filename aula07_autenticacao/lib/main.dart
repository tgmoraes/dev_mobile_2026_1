import '../telas/tela_inicial.dart';
import '../providers/auth_provider.dart';
import '../providers/pessoa_provider.dart';
import '../util/rotas.dart';
import '../telas/tela_form.dart';
import '../telas/tela_detalhes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create:  (context) => PessoaProvider()),
      ] ,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme:  ColorScheme.fromSeed(seedColor: Colors.purple)  ,
        ),
        routes: {
          Rotas.telaInicial : (context) => const TelaInicial(),
          Rotas.telaDetalhes : (context) => TelaDados(titulo: "Detalhes pessoa"), 
          Rotas.telaForm : (context) => TelaForm(titulo: 'Adicionar pessoa'),
        },
      ),
    );
  }
}


