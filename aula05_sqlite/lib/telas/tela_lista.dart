import 'package:aula05_sqlite/models/pessoa.dart';
import 'package:aula05_sqlite/providers/pessoa_provider.dart';
import 'package:aula05_sqlite/util/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLista extends StatelessWidget {
  final String titulo;

  const TelaLista({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PessoaProvider>(context);
    provider.carregaPessoas();
    final List<Pessoa> pessoas = provider.pessoas;
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
                leading: Text(style: TextStyle(fontSize: 20), "id: ${pessoa.id}"),
                trailing: IconButton(
                  onPressed: () => provider.removePessoa(pessoa.id!), 
                  icon: Icon(Icons.delete, color: Colors.red[400],)
                ),
                tileColor: pessoa.estaFeliz ? Colors.green[300] : Colors.grey[400] ,
                subtitle: Text(pessoa.estaFeliz ? "Está feliz :)" : "Está triste :("),
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
  