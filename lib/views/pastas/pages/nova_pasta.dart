import 'package:anoteichons/main.dart';
import 'package:anoteichons/stores/pasta_store.dart';
import 'package:anoteichons/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class NovaPastaPage extends StatefulWidget {
  const NovaPastaPage({Key? key}) : super(key: key);

  @override
  State<NovaPastaPage> createState() => _NovaPastaPageState();
}

class _NovaPastaPageState extends State<NovaPastaPage> {

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  TextEditingController clear = TextEditingController();
  late PastaStore _pastaStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _pastaStore = Provider.of<PastaStore>(context);

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
                      controller: clear,
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
                        child: const Text('CRIAR PASTA'),
                        onPressed: () async {
                          _pastaStore.criarPasta();
                          _pastaStore.pegarPastas();
                          pickerColor = Color(0xff443a49);
                          currentColor = Color(0xff443a49);
                          clear.text = '';
                          final snackBar = SnackBar(
                              content: const Text('Pasta criada com sucesso!'));
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