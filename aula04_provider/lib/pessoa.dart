import 'package:flutter/material.dart';

class Pessoa{
  final String nome;
  final bool estaFeliz;

  Pessoa({required this.nome, required this.estaFeliz});
  
}

class ListaPessoas with ChangeNotifier{
  final List<Pessoa> pessoas = [
    Pessoa(nome: "Maria", estaFeliz: true),
    Pessoa(nome: "João", estaFeliz: false),
    Pessoa(nome: "Ana", estaFeliz: true),
    Pessoa(nome: "Carlos", estaFeliz: false),
    Pessoa(nome: "Sofia", estaFeliz: true),
    Pessoa(nome: "Juarez", estaFeliz: true)
  ];
  void addPessoa(Pessoa pessoa){
    pessoas.add(pessoa);
    print(pessoa.nome);
    notifyListeners();
  }
}