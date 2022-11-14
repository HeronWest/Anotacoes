import 'package:anoteichons/stores/pasta_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:string_to_hex/string_to_hex.dart';

import '../../../stores/anotacao_store.dart';
import 'dialog_excluir_pasta.dart';

class CardPastas extends StatefulWidget {
  const CardPastas({Key? key}) : super(key: key);

  @override
  State<CardPastas> createState() => _CardPastasState();
}

class _CardPastasState extends State<CardPastas> {
  late PastaStore _pastaStore;
  late AnotacaoStore _anotacaoStore;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _pastaStore = Provider.of<PastaStore>(context);
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
    await _pastaStore.pegarPastas();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
            itemCount: _pastaStore.pastas.length,
            itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: (){
                  _pastaStore.setNome(_pastaStore.pastas[index].nome);
                  _anotacaoStore.setPasta(_pastaStore.pastas[index].id!);
                  _anotacaoStore.pegarAnotacoes();
                  Navigator.of(context).pushNamed('/anotacao_page');
                },
                child: Card(
                        color: Color(int.parse(_pastaStore.pastas[index].cor!)),
                        child: ListTile(
                          leading: PopupMenuButton(
                              icon: const Icon(
                                Icons.edit_note,
                                size: 30,
                                color: Colors.white,
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        _pastaStore.id = _pastaStore.pastas[index].id!;
                                        _pastaStore.nome = _pastaStore.pastas[index].nome!;
                                        _pastaStore.cor = Color(int.parse(_pastaStore.pastas[index].cor!));
                                        Navigator.of(context).pushNamed('/editar_pasta');

                                      },
                                      child: const Text('EDITAR'),
                                    )),
                                PopupMenuItem(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _pastaStore.id = _pastaStore.pastas[index].id!;
                                        _pastaStore.nome = _pastaStore.pastas[index].nome!;
                                        _anotacaoStore.pasta = _pastaStore.pastas[index].id!;
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DialogExcluirPasta();
                                            });
                                      },
                                      child: Text('EXCLUIR')),
                                )
                              ]),
                          title: Text(_pastaStore.pastas[index].nome!,
                              style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis,)
                        ),
                ),
              );
            },
        );
      }
    );
  }
}
