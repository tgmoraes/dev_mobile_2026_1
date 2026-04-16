import 'package:flutter/material.dart';

class _Tecla extends StatelessWidget {
  final Function() click;
  final String texto;
  final Color cor;

  const _Tecla({
    required this.click,
    required this.texto,
    this.cor = const Color.fromARGB(255, 5, 92, 163),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cor,
          elevation: 2,
          fixedSize: Size(80, 80),
        ),
        onPressed: () => click(),
        child: Text(
          texto,
          style: TextStyle(fontSize: 25, color: Colors.amber[50]),
        ),
      ),
    );
  }
}

class Teclado extends StatelessWidget {
  static const _botoes = [
    "7",    "8",    "9",    "+",
    "4",    "5",    "6",    "-",
    "1",    "2",    "3",    "*",
    "CE",    "0",    "=",    "/",
  ];
  final Function(String num) click;
  const Teclado({super.key, required this.click});

  Widget _criaLinha(int ini, int fim) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _botoes
          .getRange(ini, fim)
          .map(
            (txt) => txt != "CE"
                ? _Tecla(click: () =>click(txt), texto: txt)
                : _Tecla(
                    click: () => click(txt),
                    texto: txt,
                    cor: Colors.green.shade500,
                  ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _criaLinha(0, 4),
          _criaLinha(4, 8),
          _criaLinha(8, 12),
          _criaLinha(12, 16),
        ],
      ),
    );
  }
}


