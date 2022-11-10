import 'package:flutter/material.dart';
import 'package:meu_diario/pages/editar_anotacao.dart';
import 'package:meu_diario/pages/nova_anotacao.dart';

class Routes {
  static const initial = '/';
  static const nova_Anotacao = '/nova_anotacao';
  static const editar_Anotacao = '/editar_anotacao';

  static Map<String, Widget Function(BuildContext)> routes = {
    nova_Anotacao: (BuildContext context) => NovaAnotacaoPage(),
    editar_Anotacao: (BuildContext context) => EditarAnotacaoPage()
  };
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}