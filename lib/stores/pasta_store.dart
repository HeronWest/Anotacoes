import 'dart:ui';

import 'package:mobx/mobx.dart';
import '../controllers/pasta_controller.dart';
import '../models/pasta_model.dart';
part 'pasta_store.g.dart';

class PastaStore = _Pasta with _$PastaStore;

abstract class _Pasta with Store {
  final PastaController _pastaController = PastaController();

  @observable
  int? id;

  @observable
  String nome = '';

  @observable
  Color? cor;

  @observable
  bool loaded = true;

  @observable
  List<PastaModel> pastas = [];

  @action
  setLoading() => loaded = !loaded;

  @action
  setCor(value) => cor = value;

  @action
  setNome(value) => nome = value;

  limparControladores() {
    nome = '';
    cor = null;
  }

  @action
  criarPasta() {
    setLoading();
    _pastaController.criarPasta(nome, cor.toString().replaceAll('Color', '').replaceAll('(', '').replaceAll(')', ''));
    limparControladores();
    setLoading();
  }
}