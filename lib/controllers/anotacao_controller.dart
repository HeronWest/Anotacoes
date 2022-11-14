import 'package:sqflite/sqflite.dart';
import '../daos/anotacao_dao.dart';
import '../helper/sql/db_helper.dart';
import '../models/anotacao_model.dart';

class AnotacaoController {
  final AnotacaoDao _anotacaoDao = AnotacaoDao();
  Future<Database?> get db => DatabaseHelper.getInstance().db;

  criarAnotacao(String titulo, String descricao, pasta) async {
    AnotacaoModel novaAnotacao = AnotacaoModel()
      ..pasta = pasta
      ..titulo = titulo
      ..descricao = descricao;
    _anotacaoDao.salvarAnotacao(novaAnotacao);
  }

  pegarAnotacoes(String titulo, int pasta) async {
    List<AnotacaoModel> anotacoes = await _anotacaoDao.consultarAnotacoes(titulo, pasta);
    return anotacoes;
  }
  deletarAnotacao(int id) async {
    return await _anotacaoDao.deletarAnotacao(id);
  }
  atualizarAnotacao(int id, String titulo, String descricao) async {
    return await _anotacaoDao.updateAnotacao(id, titulo, descricao);
  }
}