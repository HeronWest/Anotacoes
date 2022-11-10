// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anotacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnotacaoStore on _Anotacao, Store {
  late final _$idAtom = Atom(name: '_Anotacao.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$tituloAtom = Atom(name: '_Anotacao.titulo', context: context);

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  late final _$descricaoAtom =
      Atom(name: '_Anotacao.descricao', context: context);

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$anotacoesAtom =
      Atom(name: '_Anotacao.anotacoes', context: context);

  @override
  List<AnotacaoModel> get anotacoes {
    _$anotacoesAtom.reportRead();
    return super.anotacoes;
  }

  @override
  set anotacoes(List<AnotacaoModel> value) {
    _$anotacoesAtom.reportWrite(value, super.anotacoes, () {
      super.anotacoes = value;
    });
  }

  late final _$pesquisaAtom =
      Atom(name: '_Anotacao.pesquisa', context: context);

  @override
  String get pesquisa {
    _$pesquisaAtom.reportRead();
    return super.pesquisa;
  }

  @override
  set pesquisa(String value) {
    _$pesquisaAtom.reportWrite(value, super.pesquisa, () {
      super.pesquisa = value;
    });
  }

  late final _$loadedAtom = Atom(name: '_Anotacao.loaded', context: context);

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  late final _$setPesquisaAsyncAction =
      AsyncAction('_Anotacao.setPesquisa', context: context);

  @override
  Future setPesquisa(dynamic value) {
    return _$setPesquisaAsyncAction.run(() => super.setPesquisa(value));
  }

  late final _$novaAnotacaoAsyncAction =
      AsyncAction('_Anotacao.novaAnotacao', context: context);

  @override
  Future novaAnotacao() {
    return _$novaAnotacaoAsyncAction.run(() => super.novaAnotacao());
  }

  late final _$pegarAnotacoesAsyncAction =
      AsyncAction('_Anotacao.pegarAnotacoes', context: context);

  @override
  Future pegarAnotacoes() {
    return _$pegarAnotacoesAsyncAction.run(() => super.pegarAnotacoes());
  }

  late final _$_AnotacaoActionController =
      ActionController(name: '_Anotacao', context: context);

  @override
  dynamic setTitulo(dynamic value) {
    final _$actionInfo =
        _$_AnotacaoActionController.startAction(name: '_Anotacao.setTitulo');
    try {
      return super.setTitulo(value);
    } finally {
      _$_AnotacaoActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(dynamic value) {
    final _$actionInfo =
        _$_AnotacaoActionController.startAction(name: '_Anotacao.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_AnotacaoActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading() {
    final _$actionInfo =
        _$_AnotacaoActionController.startAction(name: '_Anotacao.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_AnotacaoActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic limparControladores() {
    final _$actionInfo = _$_AnotacaoActionController.startAction(
        name: '_Anotacao.limparControladores');
    try {
      return super.limparControladores();
    } finally {
      _$_AnotacaoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
titulo: ${titulo},
descricao: ${descricao},
anotacoes: ${anotacoes},
pesquisa: ${pesquisa},
loaded: ${loaded}
    ''';
  }
}
