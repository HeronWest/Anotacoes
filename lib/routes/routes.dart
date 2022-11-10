import 'package:flutter/material.dart';
import '../views/anotacoes/pages/editar_anotacao.dart';
import '../views/anotacoes/pages/nova_anotacao.dart';
import '../views/pastas/pages/nova_pasta.dart';

class Routes {
  static const initial = '/';
  static const nova_Anotacao = '/nova_anotacao';
  static const editar_Anotacao = '/editar_anotacao';
  static const nova_Pasta = '/nova_pasta';

  static Map<String, Widget Function(BuildContext)> routes = {
    nova_Anotacao: (BuildContext context) => NovaAnotacaoPage(),
    editar_Anotacao: (BuildContext context) => EditarAnotacaoPage(),
    nova_Pasta: (BuildContext context) => NovaPastaPage(),
  };
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}