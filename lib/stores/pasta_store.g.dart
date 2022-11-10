// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasta_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PastaStore on _Pasta, Store {
  late final _$idAtom = Atom(name: '_Pasta.id', context: context);

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

  late final _$nomeAtom = Atom(name: '_Pasta.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$corAtom = Atom(name: '_Pasta.cor', context: context);

  @override
  Color? get cor {
    _$corAtom.reportRead();
    return super.cor;
  }

  @override
  set cor(Color? value) {
    _$corAtom.reportWrite(value, super.cor, () {
      super.cor = value;
    });
  }

  late final _$loadedAtom = Atom(name: '_Pasta.loaded', context: context);

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

  late final _$pastasAtom = Atom(name: '_Pasta.pastas', context: context);

  @override
  List<PastaModel> get pastas {
    _$pastasAtom.reportRead();
    return super.pastas;
  }

  @override
  set pastas(List<PastaModel> value) {
    _$pastasAtom.reportWrite(value, super.pastas, () {
      super.pastas = value;
    });
  }

  late final _$_PastaActionController =
      ActionController(name: '_Pasta', context: context);

  @override
  dynamic setLoading() {
    final _$actionInfo =
        _$_PastaActionController.startAction(name: '_Pasta.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_PastaActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCor(dynamic value) {
    final _$actionInfo =
        _$_PastaActionController.startAction(name: '_Pasta.setCor');
    try {
      return super.setCor(value);
    } finally {
      _$_PastaActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(dynamic value) {
    final _$actionInfo =
        _$_PastaActionController.startAction(name: '_Pasta.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_PastaActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic criarPasta() {
    final _$actionInfo =
        _$_PastaActionController.startAction(name: '_Pasta.criarPasta');
    try {
      return super.criarPasta();
    } finally {
      _$_PastaActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
nome: ${nome},
cor: ${cor},
loaded: ${loaded},
pastas: ${pastas}
    ''';
  }
}
