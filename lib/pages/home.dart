import 'package:flutter/material.dart';
import 'package:meu_diario/anotacao/anotacao_store.dart';
import 'package:provider/provider.dart';

import '../appbar.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late AnotacaoStore _anotacaoStore;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _anotacaoStore = Provider.of<AnotacaoStore>(context);
    await _anotacaoStore.atualizarAnotacoes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: ListView.builder(
                  itemCount: _anotacaoStore.anotacoes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Color.fromARGB(255, 243, 243, 243),
                      child: ListTile(
                        leading: Icon(
                            Icons.edit_note,
                            size: 30,
                            color: Colors.brown,
                        ),
                        title: Text(
                          _anotacaoStore.anotacoes[index].titulo!,
                          style: TextStyle(color: Colors.brown)),
                        subtitle: Text(
                          _anotacaoStore.anotacoes[index].descricao!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          ),
                        isThreeLine: true,
                      ),
                    );
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Expanded(
                flex: 1,
                child: FractionallySizedBox(
                    widthFactor: 0.96,
                    child: ElevatedButton(
                        child: Text('NOVA ANOTAÇÃO'),
                        onPressed: () => Navigator.pushNamed(context, '/nova_anotacao')
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
