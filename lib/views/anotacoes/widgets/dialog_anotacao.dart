import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../stores/anotacao_store.dart';

class DialogAnotacao extends StatefulWidget {
  const DialogAnotacao({super.key});

  @override
  State<DialogAnotacao> createState() => _DialogAnotacaoState();
}

class _DialogAnotacaoState extends State<DialogAnotacao> {
  late AnotacaoStore _anotacaoStore;
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
    await _anotacaoStore.pegarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${_anotacaoStore.titulo}'),
      content: SingleChildScrollView(child: Text('${_anotacaoStore.descricao}')),
    );
  }
}
