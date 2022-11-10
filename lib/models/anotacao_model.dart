import 'dart:convert';
import '../../helper/sql/entity.dart';

class AnotacaoModel extends Entity {
  int? id;
  int? pasta;
  String? titulo;
  String? descricao;

  AnotacaoModel({this.id, this.titulo, this.descricao, this.pasta});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnotacaoModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          pasta == other.pasta &&
          titulo == other.titulo &&
          descricao == other.descricao);

  @override
  int get hashCode => titulo.hashCode ^ descricao.hashCode;

  @override
  String toString() {
    return 'AnotacaoModel{' +
        ' pasta: $pasta,' +
        ' id: $id,' +
        ' titulo: $titulo,' +
        ' descricao: $descricao,' +
        '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'pasta': this.pasta,
      'id': this.id,
      'titulo': this.titulo,
      'descricao': this.descricao,
    };
  }

  factory AnotacaoModel.fromJson(Map<String, dynamic> json) {
    return AnotacaoModel(
      pasta: json['pasta'] as int,
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
