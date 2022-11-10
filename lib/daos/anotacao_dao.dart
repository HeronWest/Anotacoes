import '../helper/sql/basedao.dart';
import '../models/anotacao_model.dart';

class AnotacaoDao extends BaseDao<AnotacaoModel>{

  @override
  AnotacaoModel fromMap(Map<String, dynamic> map) {
    return AnotacaoModel.fromJson(map);
  }

  @override
  String get tableName => "anotacoes";

  Future salvarAnotacao(AnotacaoModel anotacao) async {
    try {
      await save(anotacao);
    } catch (e) {
      print(e);
    }
  }
  Future consultarAnotacoes(String titulo) async {
    if (titulo == "") {
    try{
        List<AnotacaoModel> anotacoes = await query('SELECT * FROM anotacoes');
        return anotacoes;
      } catch (e) {
        print(e);
      } } else {
      List<AnotacaoModel> anotacoes = await query('SELECT * FROM anotacoes WHERE titulo LIKE "%$titulo%"');
      return anotacoes;
    }
  }
  Future deletarAnotacao(int id) async {
    try{
      var dbClient = await db;
      return await dbClient!.rawDelete('DELETE from anotacoes WHERE id="$id"');
    } catch (e) {
      print(e);
    }
  }
  Future updateAnotacao(int id, String titulo, String descricao) async {
    try{
      await query('UPDATE anotacoes SET titulo = "$titulo", descricao = "$descricao" WHERE id = "$id"');
    } catch(e){
      print(e);
    }
  }
}
