// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anotacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnotacaoStore on _Anotacao, Store {
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

  late final _$loadAtom = Atom(name: '_Anotacao.load', context: context);

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  late final _$novaAnotacaoAsyncAction =
      AsyncAction('_Anotacao.novaAnotacao', context: context);

  @override
  Future novaAnotacao() {
    return _$novaAnotacaoAsyncAction.run(() => super.novaAnotacao());
  }

  late final _$atualizarAnotacoesAsyncAction =
      AsyncAction('_Anotacao.atualizarAnotacoes', context: context);

  @override
  Future atualizarAnotacoes() {
    return _$atualizarAnotacoesAsyncAction
        .run(() => super.atualizarAnotacoes());
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
titulo: ${titulo},
descricao: ${descricao},
anotacoes: ${anotacoes},
load: ${load}
    ''';
  }
}
