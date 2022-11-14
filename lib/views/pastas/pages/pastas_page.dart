import 'package:anoteichons/stores/pasta_store.dart';
import 'package:anoteichons/views/pastas/widgets/barra_pesquisa_pastas.dart';
import 'package:anoteichons/views/pastas/widgets/card_pasta.dart';
import 'package:anoteichons/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PastaHomePage extends StatefulWidget {
  const PastaHomePage({Key? key}) : super(key: key);

  @override
  State<PastaHomePage> createState() => _PastaHomePageState();
}

class _PastaHomePageState extends State<PastaHomePage> {
  late PastaStore _pastaStore;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _pastaStore = Provider.of<PastaStore>(context);
    await _pastaStore.pegarPastas();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          children: [
            Opacity(
              opacity: 0.8,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FractionallySizedBox(
                  widthFactor: 0.98,
                  child: Observer(
                    builder: (context) {
                      return BarraPesquisa();
                    }
                  ),
                ),
              ),
            ),
            Observer(
              builder: (context) {
                return Expanded(child: CardPastas());
              }
            )
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
