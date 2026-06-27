import 'package:aula07_autenticacao/providers/auth_provider.dart';
import 'package:aula07_autenticacao/telas/tela_lista.dart';
import 'package:aula07_autenticacao/telas/tela_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return authProvider.estaAutenticado
        ? const TelaLista(titulo: 'APP de cadastro dePessoas')
        : const TelaLogin();
  }
}
