import 'package:aula04_provider/pessoa.dart';
import 'package:flutter/material.dart';

class TelaDados extends StatelessWidget{

  final String titulo;

  const TelaDados({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    //! programador garante que nao sera nulo, pois tem uma rota associada
    Pessoa pessoa = ModalRoute.of(context)?.settings.arguments as Pessoa ;
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("tela DETALHES", 
              style: TextStyle(fontSize: 24)
              ),
            Text("nome: ${pessoa.nome} e está ${pessoa.estaFeliz?"FELIZ! :)": "... triste :("}", 
              style: TextStyle( fontSize: 18)
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'voltar',
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }  
}