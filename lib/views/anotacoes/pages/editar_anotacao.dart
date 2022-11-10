import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_diario/stores/anotacao_store.dart';
import 'package:provider/provider.dart';

import '../../../widgets/appbar.dart';

class EditarAnotacaoPage extends StatefulWidget {
  const EditarAnotacaoPage({Key? key}) : super(key: key);

  @override
  State<EditarAnotacaoPage> createState() => _EditarAnotacaoPageState();
}

class _EditarAnotacaoPageState extends State<EditarAnotacaoPage> {
  late AnotacaoStore _anotacaoStore;
  TextEditingController titulo = TextEditingController();
  TextEditingController descricao = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
    titulo.text = '${_anotacaoStore.titulo}';
    descricao.text = '${_anotacaoStore.descricao}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: FractionallySizedBox(
                  widthFactor: 0.96,
                  child: TextFormField(
                    onChanged: _anotacaoStore.setTitulo,
                    controller: titulo,
                    inputFormatters: [UpperCaseTextFormatter()],
                    decoration: const InputDecoration(
                        hintText: 'Título',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: FractionallySizedBox(
                  widthFactor: 0.96,
                  child: TextFormField(
                    onChanged: _anotacaoStore.setDescricao,
                    controller: descricao,
                    minLines: 20,
                    maxLines: null,
                    decoration: const InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown)),
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                  widthFactor: 0.96,
                  child: ElevatedButton(
                      child: const Text('SALVAR MUDANÇAS'),
                      onPressed: () async {
                        await _anotacaoStore.atualizarAnotacao();
                        await _anotacaoStore.pegarAnotacoes();
                        Navigator.of(context).pop();
                        final snackBar = SnackBar(
                            content:
                            const Text('Anotação alterada com sucesso!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
