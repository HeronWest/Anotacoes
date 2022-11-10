import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_diario/anotacao/anotacao_store.dart';
import 'package:meu_diario/widgets/barra_pesquisa.dart';
import 'package:meu_diario/widgets/card_anotacao.dart';
import 'package:provider/provider.dart';

import '../widgets/appbar.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late AnotacaoStore _anotacaoStore;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
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
                        padding: EdgeInsets.only(top: 8.0),
                        child: FractionallySizedBox(
                          widthFactor: 0.98,
                          child: Observer(
                            builder: (context) {
                              return _anotacaoStore.loaded ? BarraPesquisa() : Center(child: CircularProgressIndicator());
                            }
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 12, child: CardAnotacoes()),
                  ],
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/nova_anotacao'),
        backgroundColor: Colors.brown,
        child: const Icon(
          Icons.add_outlined,
          size: 30,
        ),
      ),
    );
  }
}
