import 'package:meu_diario/anotacao/anotacao_controller.dart';
import 'package:mobx/mobx.dart';

import 'anotacao_model.dart';
part 'anotacao_store.g.dart';

class AnotacaoStore = _Anotacao with _$AnotacaoStore;

abstract class _Anotacao with Store {
  final AnotacaoController _anotacaoController = AnotacaoController();

  @observable
  String titulo = '';

  @observable
  String descricao = '';

  @observable
  List<AnotacaoModel> anotacoes = [];

  @observable
  bool load = false;

  @action
  setTitulo(value) => titulo = value;

  @action
  setDescricao(value) => descricao = value;

  @action
  setLoading() => load = !load;

  @action
  limparControladores(){
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
  atualizarAnotacoes() async {
    anotacoes = await _anotacaoController.pegarAnotacoes();
    print('anotacoes: $anotacoes');
  }
}