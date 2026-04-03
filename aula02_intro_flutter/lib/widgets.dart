import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget{
  final Function _clickBotao;
  final String _texto;
  
  const MeuBotao(this._clickBotao, this._texto, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 2, 81, 146),
        elevation: 2
      ),
      onPressed: ()=> _clickBotao(), 
      child: Text(_texto, style: TextStyle(
          fontSize: 20, 
          color: Colors.amber[50]
        )
      )
    );
  }
  
}


class Botoes extends StatelessWidget {
  final Function _paraLike;
  final Function _paraReset;
  final Function _paraDeslike;

  const Botoes(this._paraLike, this._paraDeslike, this._paraReset, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceAround,
      children: [
        MeuBotao(() => _paraLike(),"like :)"),
        MeuBotao(() => _paraDeslike(), "delike :("),
        MeuBotao(() => _paraReset(), "resetar :|") 
      ],
    );
  }
}

class MeuTexto extends StatelessWidget{
  final String _texto;
  const MeuTexto(this._texto, {super.key});
  @override
  Widget build(BuildContext context) {
    return Text(_texto, 
      style: TextStyle(
        fontSize:18, 
        color: const Color.fromARGB(255, 82, 61, 1)
        )
      );
  }
  

}