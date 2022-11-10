import 'package:anoteichons/routes/routes.dart';
import 'package:anoteichons/stores/anotacao_store.dart';
import 'package:anoteichons/stores/pasta_store.dart';
import 'package:anoteichons/views/anotacoes/pages/anotacoes_page.dart';
import 'package:anoteichons/views/pastas/pages/pastas_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AnotacaoStore _anotacaoStore = AnotacaoStore();
  final PastaStore _pastaStore = PastaStore();

  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AnotacaoStore>(create: (_) => _anotacaoStore),
        Provider<PastaStore>(create: (_) => _pastaStore)
      ],
      child: MaterialApp(
        initialRoute: Routes.initial,
        routes: Routes.routes,
        title: 'ANOTAÇÔES',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.brown,
        ),
        home: PastaHomePage(),
      ),
    );
  }
}
