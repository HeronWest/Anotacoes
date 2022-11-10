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
  }

