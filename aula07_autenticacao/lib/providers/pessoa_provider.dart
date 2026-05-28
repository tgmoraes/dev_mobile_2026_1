import '../models/pessoa.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PessoaProvider with ChangeNotifier{
  final List<Pessoa> _pessoas = [];
  final String _url = "https://teste-ddm-ifsc-default-rtdb.firebaseio.com/pessoas.json";

  List<Pessoa> get pessoas => _pessoas;

  Future<void> carregaPessoas() async{
    final response = await http.get(Uri.parse(_url));

    final dados = jsonDecode(response.body);
    dados.forEach((key, value) {
      value["id"] = key;
      final pessoa = Pessoa.fromMap(value);
      _pessoas.add(pessoa);
    });
    notifyListeners();
  }

  Future<void> addPessoa(Pessoa pessoa) async{
    
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(pessoa.toMap()),
    );
    pessoa.id = jsonDecode(response.body)["name"];
    _pessoas.add(pessoa);
    notifyListeners();
  }

  void removePessoa(String id){
    //deve ser feito (remover no firebase)
  }

}