import 'package:meu_diario/anotacao/anotacao_dao.dart';
import 'package:meu_diario/helper/sql/db_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'anotacao_model.dart';

class AnotacaoController {
  final AnotacaoDao _anotacaoDao = AnotacaoDao();
  Future<Database?> get db => DatabaseHelper.getInstance().db;

  criarAnotacao(String titulo, String descricao) async {
    AnotacaoModel novaAnotacao = AnotacaoModel()
      ..titulo = titulo
      ..descricao = descricao;
    _anotacaoDao.salvarAnotacao(novaAnotacao);
  }

  pegarAnotacoes() async {
    List<AnotacaoModel> anotacoes = await _anotacaoDao.consultarAnotacoes();
    return anotacoes;
  }
}