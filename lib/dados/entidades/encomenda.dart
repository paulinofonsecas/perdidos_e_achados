// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';

class EncomendaModel {
  final String id;
  final String userId;
  final ItemModel produto;
  final String localizacao;
  final String numero;
  final DateTime resgatadoDate;

  EncomendaModel({
    required this.id,
    required this.userId,
    required this.produto,
    required this.localizacao,
    required this.numero,
    required this.resgatadoDate,
  });

  EncomendaModel copyWith({
    String? id,
    String? userId,
    ItemModel? produto,
    String? localizacao,
    String? numero,
    DateTime? resgatadoDate,
  }) {
    return EncomendaModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      produto: produto ?? this.produto,
      localizacao: localizacao ?? this.localizacao,
      numero: numero ?? this.numero,
      resgatadoDate: resgatadoDate ?? this.resgatadoDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'produto': produto.toMap(),
      'localizacao': localizacao,
      'numero': numero,
      'resgatadoDate': resgatadoDate.millisecondsSinceEpoch,
    };
  }

  factory EncomendaModel.fromMap(Map<String, dynamic> map) {
    return EncomendaModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      produto: ItemModel.fromMap(map['produto'] as Map<String, dynamic>),
      localizacao: map['localizacao'] as String,
      numero: map['numero'] as String,
      resgatadoDate:
          DateTime.fromMillisecondsSinceEpoch(map['resgatadoDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory EncomendaModel.fromJson(String source) =>
      EncomendaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EncomendaModel(id: $id, userId: $userId, produto: $produto, localizacao: $localizacao, numero: $numero, resgatadoDate: $resgatadoDate)';
  }

  @override
  bool operator ==(covariant EncomendaModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.produto == produto &&
        other.localizacao == localizacao &&
        other.numero == numero &&
        other.resgatadoDate == resgatadoDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        produto.hashCode ^
        localizacao.hashCode ^
        numero.hashCode ^
        resgatadoDate.hashCode;
  }
}
