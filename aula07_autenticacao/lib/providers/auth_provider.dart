import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String? _token;
  String? _email;
  String? _id;
  DateTime? _dataExpiracao;
  static const String _apiKey = 'AIzaSyDisfW-94dLfmNi6CIotSC0GdL2BPOgyi8';

  bool get estaAutenticado {
    final valido = _dataExpiracao?.isAfter(DateTime.now()) ?? false;
    return _token != null && valido; // se tem token e é válido
  }

  String? get token {
    return estaAutenticado ? _token : null;
  }

  String? get email {
    return estaAutenticado ? _email : null;
  }

  String? get id {
    return estaAutenticado ? _id : null;
  }

  Future<void> _autentica(String email, String password, String funcao) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$funcao?key=$_apiKey';
    
    print(url);
    
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      print(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _id = body['localId'];
 
      final int segundos = int.parse(body['expiresIn']);
 
      _dataExpiracao = DateTime.now().add(
        Duration(
          seconds: segundos,
        ),
      );
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    // Simula uma chamada de login
    await Future.delayed(Duration(seconds: 2));
    print('Usuário logado: $email');
    return _autentica(email, password, 'signInWithPassword');
  }

  Future<void> cadastra(String email, String password) async {
    // Simula uma chamada de registro
    await Future.delayed(Duration(seconds: 2));
    //print('Usuário registrado: $email');
    return _autentica(email, password, 'signUp');

  }

  void logout() {
    _token = null;
    _email = null;
    _id = null;
    _dataExpiracao = null;
    notifyListeners();
  }
}