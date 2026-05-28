import '../models/endereco.dart';
import '../util/cep_service.dart';
import '../models/pessoa.dart';
import '../providers/pessoa_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaForm extends StatefulWidget {
  final String titulo;
  
  const TelaForm({super.key, required this.titulo});

  @override
  State<TelaForm> createState() => _TelaFormState();
}

class _TelaFormState extends State<TelaForm> {
  Endereco? _endereco;
  Pessoa? _pessoa;
  String _txtEnd = "";

  final _nomeController = TextEditingController();
  final _cepController = TextEditingController();

  Future<void> _mostraEndereco() async {
    setState((){
      _txtEnd = "Carregando...";
    });
    try{
      final end = await CepService.buscarEndereco(_cepController.text);    
    
      setState(() {
        _txtEnd = "Endereco: ${end.toString()}";
      });
      _endereco = end;
    }catch(e){
      setState(() {
        _txtEnd = "Erro, forneça um CEP válido (XXXXX-XXX)";
      });
    }
  }

  void _salva() {
    if(!(_endereco == null || _nomeController.text.isEmpty)){
      _pessoa = Pessoa(nome: _nomeController.text, endereco: _endereco!);
      final provider = Provider.of<PessoaProvider>(context, listen: false);
      provider.addPessoa(_pessoa!);
      Navigator.pop(context);
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
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              "Dados Pessoa",
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
            TextField(
              style: TextStyle(backgroundColor: Colors.yellow[100],
                fontSize: 22, fontWeight: FontWeight.bold) ,
              controller: _cepController,
              decoration: InputDecoration(
                label: Text( style: TextStyle(fontSize: 22), "Informe o CEP!"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
              onTapOutside: (_) => _mostraEndereco(),
            ),
            Text(_txtEnd),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _salva,
        tooltip: 'enviar',
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
