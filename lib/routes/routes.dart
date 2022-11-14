import 'package:anoteichons/views/anotacoes/pages/anotacoes_page.dart';
import 'package:anoteichons/views/pastas/pages/editar_pasta_page.dart';
import 'package:flutter/material.dart';
import '../views/anotacoes/pages/editar_anotacao.dart';
import '../views/anotacoes/pages/nova_anotacao.dart';
import '../views/pastas/pages/nova_pasta.dart';

class Routes {
  static const initial = '/';
  static const nova_Anotacao = '/nova_anotacao';
  static const editar_Anotacao = '/editar_anotacao';
  static const anotacao_page = '/anotacao_page';
  static const nova_Pasta = '/nova_pasta';
  static const editar_Pasta = '/editar_pasta';

  static Map<String, Widget Function(BuildContext)> routes = {
    anotacao_page: (BuildContext context) => MyHome(),
    nova_Anotacao: (BuildContext context) => NovaAnotacaoPage(),
    editar_Anotacao: (BuildContext context) => EditarAnotacaoPage(),
    nova_Pasta: (BuildContext context) => NovaPastaPage(),
    editar_Pasta: (BuildContext context) => EditarPastaPage(),
  };
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}