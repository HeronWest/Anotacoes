import 'package:sqflite/sqflite.dart';
import '../daos/pasta_dao.dart';
import '../helper/sql/db_helper.dart';
import '../models/pasta_model.dart';

class PastaController {
  final PastaDao _pastaDao = PastaDao();
  Future<Database?> get db => DatabaseHelper.getInstance().db;

  criarPasta(String nome, String cor) async {
    PastaModel pasta = PastaModel()
        ..nome = nome
        ..cor = cor;
    await _pastaDao.salvarPasta(pasta);
  }
  pegarPastas(String titulo) async {
    List<PastaModel> pastas = await _pastaDao.consultarPastas(titulo);
    return pastas;
  }
  atualizarPasta(int id, String nome, String cor) async {
    return await _pastaDao.updatePasta(id, nome, cor);
  }
  deletarPasta(id) async {
    return await _pastaDao.excluirPasta(id);
  }
}