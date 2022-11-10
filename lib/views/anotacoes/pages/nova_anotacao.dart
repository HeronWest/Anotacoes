import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../stores/anotacao_store.dart';
import '../../../widgets/appbar.dart';


class NovaAnotacaoPage extends StatefulWidget {
  const NovaAnotacaoPage({Key? key}) : super(key: key);

  @override
  State<NovaAnotacaoPage> createState() => _NovaAnotacaoPageState();
}

class _NovaAnotacaoPageState extends State<NovaAnotacaoPage> {
  late AnotacaoStore _anotacaoStore;
  TextEditingController clear = TextEditingController();
  TextEditingController clear2 = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
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
                    controller: clear2,
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
                    controller: clear,
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
                      child: const Text('ADICIONAR ANOTAÇÃO'),
                      onPressed: () async {
                        await _anotacaoStore.novaAnotacao();
                        await _anotacaoStore.pegarAnotacoes();
                        clear.text = '';
                        clear2.text = '';
                        final snackBar = SnackBar(
                            content:
                                const Text('Anotação cadastrada com sucesso!'));
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
