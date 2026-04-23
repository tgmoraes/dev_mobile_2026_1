import 'package:aula05_sqlite/models/pessoa.dart';
import 'package:aula05_sqlite/providers/pessoa_provider.dart';
import 'package:aula05_sqlite/util/rotas.dart';
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
      final provider = Provider.of<PessoaProvider>(context, listen: false);
      provider.addPessoa(_pessoa!);

      if (_dadosSalvos) {
        Navigator.pop(context);
        }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            Text(
              _dadosSalvos ? "Dados gravados" : "Nenhum dado salvo!",
              style : TextStyle(fontSize: 22, fontWeight: FontWeight.bold) 
              ),
            TextField(
              style: TextStyle(backgroundColor: Colors.yellow[100],
                fontSize: 22, fontWeight: FontWeight.bold) ,
              controller: _nomeController,
              decoration: InputDecoration(
                label: Text( style: TextStyle(fontSize: 22), "Informe o nome!"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
            ),
            SwitchListTile(
              title: Text( style: TextStyle(fontSize: 22), "você esta feliz??"),
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
