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
  String pesquisa = '';

  @observable
  List<PastaModel> pastas = [];

  @action
  setLoading() => loaded = !loaded;

  @action
  setCor(value) {
    cor = value;
  }

  @action
  setNome(value) => nome = value;

  @action
  setPesquisa(value) async {
    pesquisa = value;
    await pegarPastas();
  }

  limparControladores() {
    nome = '';
    cor = null;
  }

  @action
  criarPasta() async {
    setLoading();
    await _pastaController.criarPasta(nome, cor.toString().replaceAll('Color', '').replaceAll('(', '').replaceAll(')', ''));
    limparControladores();
    setLoading();
  }
  @action
  pegarPastas() async {
    setLoading();
    pastas = await _pastaController.pegarPastas(pesquisa);
    setLoading();
  }
  @action
  atualizarPasta() async {
    await _pastaController.atualizarPasta(id!, nome, cor.toString().replaceAll('Color', '').replaceAll('(', '').replaceAll(')', ''));
  }
  deletarPasta() async {
    await _pastaController.deletarPasta(id);
  }
}