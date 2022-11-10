import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../stores/anotacao_store.dart';
import 'dialog_anotacao.dart';
import 'dialog_excluir.dart';

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
    await _anotacaoStore.pegarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView.builder(
          itemCount: _anotacaoStore.anotacoes.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                _anotacaoStore.setTitulo(_anotacaoStore.anotacoes[index].titulo);
                _anotacaoStore.setDescricao(_anotacaoStore.anotacoes[index].descricao);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogAnotacao();
                    });
              },
              child: Card(
                color: Color.fromARGB(255, 243, 243, 243),
                child: ListTile(
                  leading: PopupMenuButton(
                      icon: const Icon(
                        Icons.edit_note,
                        size: 30,
                        color: Colors.brown,
                      ),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                child: TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                _anotacaoStore.id = _anotacaoStore.anotacoes[index].id!;
                                _anotacaoStore.titulo = _anotacaoStore.anotacoes[index].titulo!;
                                _anotacaoStore.descricao = _anotacaoStore.anotacoes[index].descricao!;
                                Navigator.of(context).pushNamed('/editar_anotacao');

                              },
                              child: const Text('EDITAR'),
                            )),
                            PopupMenuItem(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _anotacaoStore.id = _anotacaoStore.anotacoes[index].id!;
                                    _anotacaoStore.titulo = _anotacaoStore.anotacoes[index].titulo!;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DialogExcluir();
                                        });
                                  },
                                  child: Text('EXCLUIR')),
                            )
                          ]),
                  title: Text(_anotacaoStore.anotacoes[index].titulo!,
                      style: TextStyle(color: Colors.brown)),
                  subtitle: Text(
                    _anotacaoStore.anotacoes[index].descricao!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isThreeLine: true,
                ),
              ),
            );
          });
    });
  }
}
