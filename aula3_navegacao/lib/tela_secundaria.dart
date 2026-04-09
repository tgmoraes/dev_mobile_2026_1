import 'package:flutter/material.dart';

class TelaDados extends StatelessWidget{
  final String nome;

  const TelaDados({super.key, required this.nome});


  @override
  Widget build(BuildContext context) {
    //final Aluno aluno = ModalRoute.of(context).settings.arguments as Aluno ;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("tela 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("tela dois", 
              style: TextStyle(fontSize: 24)
              ),
            Text("nome: $nome", 
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