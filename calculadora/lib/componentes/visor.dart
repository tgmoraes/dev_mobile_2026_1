import 'package:flutter/material.dart';

class Visor extends StatelessWidget {
  final String _texto;
  const Visor(this._texto, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 70,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              border: Border.all(color: Colors.brown, width: 2),
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text(
              _texto,
              style: TextStyle(
                fontSize: 36,
                color: const Color.fromARGB(255, 82, 61, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}