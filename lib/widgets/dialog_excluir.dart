import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../anotacao/anotacao_store.dart';

class DialogExcluir extends StatefulWidget {
  const DialogExcluir({super.key});

  @override
  State<DialogExcluir> createState() => _DialogExcluirState();
}

class _DialogExcluirState extends State<DialogExcluir> {
  late AnotacaoStore _anotacaoStore;
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
    await _anotacaoStore.pegarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Tem certeza que deseja excluir a seguinte anotação:',
        style: TextStyle(fontSize: 16),
      ),
      content: Text('${_anotacaoStore.titulo}', style: TextStyle(fontSize: 20)),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar')),
        TextButton(onPressed: () async {
          await _anotacaoStore.deletarAnotacao();
          await _anotacaoStore.pegarAnotacoes();
          Navigator.of(context).pop();
        }, child: Text('Excluir'))
      ],
    );
  }
}
