import 'dart:convert';
import '../models/endereco.dart';
import 'package:http/http.dart' as http;

class CepService{

  static const String _baseUrl = 'https://viacep.com.br/ws';

  static Future<Endereco> buscarEndereco(String cep) async {
    final url = Uri.parse('$_baseUrl/$cep/json/');
    final response = await http.get(url);
    //verifica se a resposta foi bem sucedida (HTTP 200);
    if (response.statusCode == 200) {
      final mapa = jsonDecode(response.body);
      mapa["cidade"] = mapa["localidade"];
      return Endereco.fromMap(mapa);
    }
    throw Exception('Erro ao buscar CEP: ${response.statusCode}');
  }
}


