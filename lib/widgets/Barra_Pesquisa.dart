import 'package:flutter/material.dart';

class BarraPesquisa extends StatelessWidget {
  const BarraPesquisa ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown)
        ),
      ),
    );
  }
}
