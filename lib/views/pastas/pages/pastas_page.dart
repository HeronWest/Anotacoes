import 'package:anoteichons/views/pastas/pages/barra_pesquisa.dart';
import 'package:anoteichons/widgets/appbar.dart';
import 'package:flutter/material.dart';

class PastaHomePage extends StatefulWidget {
  const PastaHomePage({Key? key}) : super(key: key);

  @override
  State<PastaHomePage> createState() => _PastaHomePageState();
}

class _PastaHomePageState extends State<PastaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          children: [
            BarraPesquisa()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/nova_pasta'),
        backgroundColor: Colors.brown,
        child: const Icon(
          Icons.add_outlined,
          size: 30,
        ),
      ),
    );
  }
}
