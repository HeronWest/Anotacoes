import 'package:anoteichons/main.dart';
import 'package:anoteichons/stores/pasta_store.dart';
import 'package:anoteichons/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class EditarPastaPage extends StatefulWidget {
  const EditarPastaPage({Key? key}) : super(key: key);

  @override
  State<EditarPastaPage> createState() => _EditarPastaPageState();
}

class _EditarPastaPageState extends State<EditarPastaPage> {

  late Color pickerColor;
  late Color currentColor;
  late PastaStore _pastaStore;
  TextEditingController nome = TextEditingController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _pastaStore = Provider.of<PastaStore>(context);
    nome.text = _pastaStore.nome;
    pickerColor = _pastaStore.cor!;
    currentColor = _pastaStore.cor!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: FractionallySizedBox(
                  widthFactor: 0.96,
                  child: TextFormField(
                    controller: nome,
                    onChanged: _pastaStore.setNome,
                    inputFormatters: [UpperCaseTextFormatter()],
                    decoration: const InputDecoration(
                        hintText: 'Nome da pasta',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: FractionallySizedBox(
                    widthFactor: 0.96,
                    child: ColorPicker(
                      pickerColor: pickerColor,
                      onColorChanged: _pastaStore.setCor,
                    )),
              ),
              FractionallySizedBox(
                  widthFactor: 0.96,
                  child: ElevatedButton(
                      child: const Text('SALVAR MUDANÇAS'),
                      onPressed: () async {
                        _pastaStore.atualizarPasta();
                        _pastaStore.pegarPastas();
                        Navigator.of(context).pop();
                        final snackBar = SnackBar(
                            content: const Text('Pasta atualizada com sucesso!'));
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