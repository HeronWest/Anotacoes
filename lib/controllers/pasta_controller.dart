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

}