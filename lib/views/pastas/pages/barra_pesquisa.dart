import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../stores/anotacao_store.dart';

class BarraPesquisa extends StatefulWidget {
  const BarraPesquisa ({Key? key}) : super(key: key);

  @override
  State<BarraPesquisa> createState() => _BarraPesquisaState();
}

class _BarraPesquisaState extends State<BarraPesquisa> {

  late AnotacaoStore _anotacaoStore;
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [UpperCaseTextFormatter()],
      decoration: InputDecoration(
        hintText: 'Anotações',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown)
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