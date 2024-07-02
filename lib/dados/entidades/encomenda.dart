// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gestao_restaurante/dados/entidades/produto_model.dart';

class EncomendaModel {
  final String id;
  final String userId;
  final ProdutoModel produto;
  final String localizacao;
  final String numero;
  final bool estaEmAndamento;
  final DateTime encomendaDate;

  EncomendaModel({
    required this.id,
    required this.userId,
    required this.produto,
    required this.localizacao,
    required this.numero,
    required this.estaEmAndamento,
    required this.encomendaDate,
  });

  EncomendaModel copyWith({
    String? id,
    String? userId,
    ProdutoModel? produto,
    String? localizacao,
    String? numero,
    bool? estaEmAndamento,
    DateTime? encomendaDate,
  }) {
    return EncomendaModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      produto: produto ?? this.produto,
      localizacao: localizacao ?? this.localizacao,
      numero: numero ?? this.numero,
      estaEmAndamento: estaEmAndamento ?? this.estaEmAndamento,
      encomendaDate: encomendaDate ?? this.encomendaDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'produto': produto.toMap(),
      'localizacao': localizacao,
      'numero': numero,
      'estaEmAndamento': estaEmAndamento,
      'encomendaDate': encomendaDate.millisecondsSinceEpoch,
    };
  }

  factory EncomendaModel.fromMap(Map<String, dynamic> map) {
    return EncomendaModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      produto: ProdutoModel.fromMap(map['produto'] as Map<String, dynamic>),
      localizacao: map['localizacao'] as String,
      numero: map['numero'] as String,
      estaEmAndamento: map['estaEmAndamento'] as bool,
      encomendaDate:
          DateTime.fromMillisecondsSinceEpoch(map['encomendaDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory EncomendaModel.fromJson(String source) =>
      EncomendaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EncomendaModel(id: $id, userId: $userId, produto: $produto, localizacao: $localizacao, numero: $numero, estaEmAndamento: $estaEmAndamento, encomendaDate: $encomendaDate)';
  }

  @override
  bool operator ==(covariant EncomendaModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.produto == produto &&
        other.localizacao == localizacao &&
        other.numero == numero &&
        other.estaEmAndamento == estaEmAndamento &&
        other.encomendaDate == encomendaDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        produto.hashCode ^
        localizacao.hashCode ^
        numero.hashCode ^
        estaEmAndamento.hashCode ^
        encomendaDate.hashCode;
  }
}
