import 'package:aula02_intro_flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text("titulo APP"),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  var _contLikes = 0;

  void daLike() {
    setState(() {
      _contLikes++;
    });
  }

  void resertarLike() {
    setState(() {
      _contLikes = 0;
    });
  }
  void daDislike() {
    setState(() {
      _contLikes = _contLikes==0?0:_contLikes--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MeuTexto("Olá, seja bem-vindo!"),
          MeuTexto("conta dor de likes:"),
          MeuTexto("dores do coração: $_contLikes"),
          Botoes( ()=> daLike(), 
                  ()=> daDislike(),
                  () => resertarLike()
                )
        ],
      ),
    );
  }
  
}

