import '../helper/sql/basedao.dart';
import 'anotacao_model.dart';

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
  Future consultarAnotacoes() async {
      try{
        List<AnotacaoModel> anotacoes = await query(
          'SELECT * FROM anotacoes'
        );
        return anotacoes;
      } catch (e) {
        print(e);
      }
  }

  }
