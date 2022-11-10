import 'package:meu_diario/anotacao/anotacao_controller.dart';
import 'package:mobx/mobx.dart';

import 'anotacao_model.dart';
part 'anotacao_store.g.dart';

class AnotacaoStore = _Anotacao with _$AnotacaoStore;

abstract class _Anotacao with Store {
  final AnotacaoController _anotacaoController = AnotacaoController();

  @observable
  int? id;

  @observable
  String titulo = '';

  @observable
  String descricao = '';

  @observable
  List<AnotacaoModel> anotacoes = [];

  @observable
  String pesquisa = '';

  @observable
  bool loaded = true;

  @action
  setTitulo(value) => titulo = value;

  @action
  setDescricao(value) => descricao = value;

  @action
  setPesquisa(value) async {
    pesquisa = value;
    await pegarAnotacoes();
  }

  @action
  setLoading() => loaded = !loaded;

  @action
  limparControladores() {
    titulo = '';
    descricao = '';
  }

  @action
  novaAnotacao() async {
    setLoading();
    _anotacaoController.criarAnotacao(titulo, descricao);
    limparControladores();
    setLoading();
  }

  @action
  pegarAnotacoes() async {
    setLoading();
    anotacoes = await _anotacaoController.pegarAnotacoes(pesquisa);
    setLoading();
  }
  deletarAnotacao() async {
    await _anotacaoController.deletarAnotacao(id!);
  }
  atualizarAnotacao() async {
    await _anotacaoController.atualizarAnotacao(id!, titulo, descricao);
  }
}
