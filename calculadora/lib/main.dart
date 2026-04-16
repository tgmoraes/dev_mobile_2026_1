
import 'package:calculadora/componentes/teclado.dart';
import 'package:calculadora/componentes/visor.dart';
import 'package:calculadora/processador_expressao.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      home: const PrimeiraPagina(title: 'Calculadora Demo de Inteiros'),
    );
  }
}

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({super.key, required this.title});

  final String title;

  @override
  State<PrimeiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  final _processador = ProcessadorExpressao();
  String _txtVisor = "0";
  void _mudaVisor(String num) {
    setState(() {
      _txtVisor = _processador.processaChar(num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text(widget.title),

      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10,right:10),
        child: Column(
          children: [
              Visor(_txtVisor),
              Teclado( click: _mudaVisor)
          ]
        ),
      ),
    );
  }
}
