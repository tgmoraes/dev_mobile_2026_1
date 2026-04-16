import 'package:aula04_provider/pessoa.dart';
import 'package:aula04_provider/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLista extends StatelessWidget {
  final String titulo;

  TelaLista({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final List<Pessoa> pessoas = Provider.of<ListaPessoas>(context).pessoas;
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      body: ListView.builder(
          itemCount: pessoas.length,
          itemBuilder: (context, index) {
            final pessoa = pessoas[index];
            return Card(
              elevation: 3,
              color: Colors.lightBlue[200],
              child: ListTile(
                title: Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ,
                  pessoa.nome),
                leading: Text("leading"),
                subtitle: Text("subtitle"),
                trailing: Text("trailing"),
                //tileColor: pessoa.estaFeliz ? Colors.green[300] : Colors.red[300] ,
                //subtitle: Text(pessoa.estaFeliz ? "Está feliz :)" : "Está triste :("),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Rotas.telaDetalhes,
                    arguments: pessoa,
                  );
                },
              ),
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, Rotas.telaForm);
        },
        tooltip: 'adicionar pessoa',
        child: const Icon(Icons.add_box_rounded),
      )
    );
  }
}
  