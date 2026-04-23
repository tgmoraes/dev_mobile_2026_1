import 'package:aula05_sqlite/models/model.dart';

class Pessoa implements Model {
  int? _id;
  final String nome;
  final bool estaFeliz;

  Pessoa({required this.nome, required this.estaFeliz});

  @override
  set id(int id) {
    _id = id;
  }

  @override
  int? get id => _id;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nome': nome,
      'estaFeliz': estaFeliz?1:0,
    };
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    var pessoa = Pessoa(
      nome: map['nome'] as String,
      estaFeliz: map['estaFeliz']==0?false:true,
    );
    pessoa.id = map['id'] as int;
    return pessoa;
  }
  
  @override
  String toString() {
    return 'Pessoa{id: $_id, nome: $nome, estaFeliz: $estaFeliz}';
  }
}


