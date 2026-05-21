class Endereco {
  final String cep;
  final String logradouro;
  final String bairro;
  final String cidade;

  Endereco({required this.cep, required this.logradouro, required this.bairro, required this.cidade});

  factory Endereco.fromMap(Map<String, dynamic> map) {
    
    return Endereco(
      cep: map['cep'],
      logradouro: map['logradouro'],
      bairro: map['bairro'],
      cidade: map['cidade'],
    );
  }

  @override
  toString() {
    return 'CEP: $cep, Logradouro: $logradouro, Bairro: $bairro, Cidade: $cidade';
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'cidade': cidade
    };
  }
}