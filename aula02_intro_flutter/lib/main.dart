import 'package:flutter/material.dart';

main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var contLikes = 0;

  void daLike() {
    setState(() {
      this.contLikes++;
    });
  }


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
        body: Center(
          child: Column(
            children: [
              Text("Olá, seja bem-vindo!"),
              Text("conta dor de likes:"),
              Text("dores do coração: ${this.contLikes}"),
              IconButton(
                onPressed: daLike,
                icon: Icon(size: 50, Icons.favorite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}