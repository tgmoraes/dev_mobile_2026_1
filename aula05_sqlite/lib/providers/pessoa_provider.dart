import 'package:aula05_sqlite/models/pessoa.dart';
import 'package:aula05_sqlite/util/db.dart';
import 'package:flutter/material.dart';

class PessoaProvider with ChangeNotifier{
  List<Pessoa> _pessoas = [];

  List<Pessoa> get pessoasDummy {
    _pessoas  = [
    Pessoa(nome: "Maria", estaFeliz: true),
    Pessoa(nome: "João", estaFeliz: false),
    Pessoa(nome: "Ana", estaFeliz: true),
    Pessoa(nome: "Carlos", estaFeliz: false),
    Pessoa(nome: "Sofia", estaFeliz: true),
    Pessoa(nome: "Juarez", estaFeliz: true)
    ];
    return _pessoas;
  }

  List<Pessoa> get pessoas => _pessoas;

  Future<void> carregaPessoas() async{
    _pessoas = await DBUtil.list("Pessoa")
      .then((res) =>
       _pessoas = res.map( (mapa) => Pessoa.fromMap(mapa)).toList());
    notifyListeners();
  }

  void addPessoa(Pessoa pessoa){
    DBUtil.insert(pessoa);
    _pessoas.add(pessoa);
    notifyListeners();
  }

  void removePessoa(int id){
    DBUtil.delete("Pessoa", id);
    _pessoas.removeWhere((pessoa) => pessoa.id == id);
    notifyListeners();
  }

}