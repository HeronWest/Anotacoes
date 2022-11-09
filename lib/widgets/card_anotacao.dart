import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../anotacao/anotacao_store.dart';

class CardAnotacoes extends StatefulWidget {
  const CardAnotacoes({Key? key}) : super(key: key);

  @override
  State<CardAnotacoes> createState() => _CardAnotacoesState();
}

class _CardAnotacoesState extends State<CardAnotacoes> {
  late AnotacaoStore _anotacaoStore;
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
    await _anotacaoStore.atualizarAnotacoes();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
            itemCount: _anotacaoStore.anotacoes.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Color.fromARGB(255, 243, 243, 243),
                child: ListTile(
                  leading: Icon(
                    Icons.edit_note,
                    size: 30,
                    color: Colors.brown,
                  ),
                  title: Text(
                      _anotacaoStore.anotacoes[index].titulo!,
                      style: TextStyle(color: Colors.brown)),
                  subtitle: Text(
                    _anotacaoStore.anotacoes[index].descricao!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isThreeLine: true,
                ),
              );
            }
        );
      }
    );
  }
}
