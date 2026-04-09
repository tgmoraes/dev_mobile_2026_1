import 'package:aula3_navegacao/tela_secundaria.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _dadosSalvos = false;
  var _nome;
  final _nomeController = TextEditingController();

  void _mostra_dados() {
    setState(() {
      print(_nomeController.text);
      _nome = _nomeController.text;
      _dadosSalvos = _nome != null && _nome != "";
    });
  }

  void _troca_tela() {
    if (_dadosSalvos) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaDados(nome: _nome)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(_dadosSalvos ? "Dados gravados" : "Nenhum dado salvo!"),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: "Informe o nome",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: _mostra_dados,
              child: const Icon(Icons.done_outline_outlined),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _troca_tela,
        tooltip: 'enviar',
        child: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}
