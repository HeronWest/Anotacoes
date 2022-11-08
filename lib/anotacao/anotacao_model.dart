import 'dart:convert';
import '../../helper/sql/entity.dart';

class AnotacaoModel extends Entity {

  String? titulo;
  String? descricao;

  AnotacaoModel({

    this.titulo,
    this.descricao
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AnotacaoModel &&
              runtimeType == other.runtimeType &&
              titulo == other.titulo &&
              descricao == other.descricao);

  @override
  int get hashCode =>
      titulo.hashCode ^
      descricao.hashCode;

  @override
  String toString() {
    return 'AnotacaoModel{' +
        ' titulo: $titulo,' +
        ' descricao: $descricao,' +
        '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': this.titulo,
      'descricao': this.descricao,
    };
  }

  factory AnotacaoModel.fromJson(Map<String, dynamic> json) {
    return AnotacaoModel(
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
