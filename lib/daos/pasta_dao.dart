import '../helper/sql/basedao.dart';
import '../models/pasta_model.dart';

class PastaDao extends BaseDao<PastaModel>{

  @override
  PastaModel fromMap(Map<String, dynamic> map) {
    return PastaModel.fromJson(map);
  }

  @override
  String get tableName => "pastas";

  Future salvarPasta(PastaModel pasta) async {
    try{
      await save(pasta);
    } catch(e){
      print(e);
    }
  }
  Future consultarPastas(String titulo) async {
    if (titulo == "") {
      try{
        List<PastaModel> pastas = await query('SELECT * FROM pastas');
        return pastas;
      } catch (e) {
        print(e);
      } } else {
      List<PastaModel> pastas = await query('SELECT * FROM pastas WHERE nome LIKE "%$titulo%"');
      return pastas;
    }
  }
  Future updatePasta(int id, String nome, String cor) async {
    try{
      await query('UPDATE pastas SET nome = "$nome", cor = "$cor" WHERE id = "$id"');
    } catch(e){
      print(e);
    }
  }
  Future excluirPasta(id) async {
    try{
      await query('DELETE FROM anotacoes WHERE pasta = "$id"');
      await query('DELETE FROM pastas WHERE id = "$id"');
    } catch(e){
      print(e);
    }
  }
  }

