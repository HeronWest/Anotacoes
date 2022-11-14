import 'package:anoteichons/stores/pasta_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../../stores/anotacao_store.dart';

class DialogExcluirPasta extends StatefulWidget {
  const DialogExcluirPasta({super.key});

  @override
  State<DialogExcluirPasta> createState() => _DialogExcluirPastaState();
}

class _DialogExcluirPastaState extends State<DialogExcluirPasta> {
  late AnotacaoStore _anotacaoStore;
  late PastaStore _pastaStore;
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
    _pastaStore = Provider.of<PastaStore>(context);
    await _anotacaoStore.pegarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Tem certeza que deseja excluir a seguinte pasta:',
        style: TextStyle(fontSize: 16),
      ),
      content: Text('${_pastaStore.nome}', style: TextStyle(fontSize: 20)),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar')),
        TextButton(onPressed: () async {
          await _pastaStore.deletarPasta();
          await _pastaStore.pegarPastas();
          Navigator.of(context).pop();
        }, child: Text('Excluir'))
      ],
    );
  }
}
