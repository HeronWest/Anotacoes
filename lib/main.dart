import 'package:flutter/material.dart';
import 'package:meu_diario/stores/anotacao_store.dart';
import 'package:meu_diario/routes/routes.dart';
import 'package:meu_diario/views/anotacoes/pages/anotacoes_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AnotacaoStore _anotacaoStore = AnotacaoStore();

  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AnotacaoStore>(create: (_) => _anotacaoStore),
      ],
      child: MaterialApp(
        initialRoute: Routes.initial,
        routes: Routes.routes,
        title: 'ANOTAÇÔES',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.brown,
        ),
        home: MyHome(),
      ),
    );
  }
}
