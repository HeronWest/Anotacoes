import 'dart:convert';
import '../../helper/sql/entity.dart';

class PastaModel extends Entity {
  int? id;
  String? nome;
  String? cor;

  PastaModel({this.id, this.nome, this.cor});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is PastaModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              nome == other.nome &&
              cor == other.cor);

  @override
  int get hashCode => nome.hashCode ^ cor.hashCode;

  @override
  String toString() {
    return 'PastaModel{' +
        ' id: $id,' +
        ' nome: $nome,' +
        ' cor: $cor,' +
        '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nome': this.nome,
      'cor': this.cor,
    };
  }

  factory PastaModel.fromJson(Map<String, dynamic> json) {
    return PastaModel(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cor: json['cor'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
