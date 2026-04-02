import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
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
          child: Column(children: [Text("oi"), Text("oie"), Text("ois"), 
          IconButton(onPressed:(){}, icon: Icon(size:50, Icons.favorite))
          ]),
        ),
      ),
    );
  }
}