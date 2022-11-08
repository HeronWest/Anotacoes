import 'package:flutter/material.dart';
import 'package:meu_diario/pages/nova_anotacao.dart';

class Routes {
  static const initial = '/';
  static const nova_Anotacao = '/nova_anotacao';

  static Map<String, Widget Function(BuildContext)> routes = {
    nova_Anotacao: (BuildContext context) => NovaAnotacaoPage()
  };
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}