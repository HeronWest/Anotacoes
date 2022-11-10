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

  pegarAnotacoes(String titulo) async {
    List<AnotacaoModel> anotacoes = await _anotacaoDao.consultarAnotacoes(titulo);
    return anotacoes;
  }
  deletarAnotacao(int id) async {
    return await _anotacaoDao.deletarAnotacao(id);
  }
  atualizarAnotacao(int id, String titulo, String descricao) async {
    return await _anotacaoDao.updateAnotacao(id, titulo, descricao);
  }
}