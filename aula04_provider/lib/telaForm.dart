import 'package:aula04_provider/pessoa.dart';
import 'package:aula04_provider/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaForm extends StatefulWidget {
  final String titulo;

  const TelaForm({super.key, required this.titulo});

  @override
  State<TelaForm> createState() => _TelaFormState();
}

class _TelaFormState extends State<TelaForm> {
  var _dadosSalvos = false;
  var _estaFeliz = false;
  Pessoa? _pessoa;
  final _nomeController = TextEditingController();

  void _mostraDados() {
    setState(() {
      _pessoa = Pessoa(
          estaFeliz:  _estaFeliz,
          nome:  _nomeController.text
        );
      _dadosSalvos = _pessoa?.nome != "";
    });
  }

  void _trocaTela() {
    if(_pessoa != null){
      final listaPessoas = Provider.of<ListaPessoas>(context, listen: false);
      print("oi:${_pessoa!.nome}");
      listaPessoas.addPessoa(_pessoa!);

      if (_dadosSalvos) {
        Navigator.pushNamed(
          context,
          Rotas.telaLista,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo)),
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
            CheckboxListTile(
              title: Text("você esta feliz?"),
              value: _estaFeliz,
              onChanged: (bool? value) => setState(() => _estaFeliz = value==true),
            ),
            ElevatedButton(
              onPressed: _mostraDados,
              child: const Icon(Icons.done_outline_outlined),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _trocaTela,
        tooltip: 'enviar',
        child: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}
