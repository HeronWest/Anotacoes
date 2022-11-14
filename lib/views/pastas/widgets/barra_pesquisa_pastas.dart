import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../stores/anotacao_store.dart';
import '../../../stores/pasta_store.dart';

class BarraPesquisa extends StatefulWidget {
  const BarraPesquisa ({Key? key}) : super(key: key);

  @override
  State<BarraPesquisa> createState() => _BarraPesquisaState();
}

class _BarraPesquisaState extends State<BarraPesquisa> {

  late PastaStore _pastaStore;
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _pastaStore = Provider.of<PastaStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _pastaStore.setPesquisa,
      inputFormatters: [UpperCaseTextFormatter()],
      decoration: InputDecoration(
        hintText: 'Pastas',
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