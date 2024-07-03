// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';

class ItemModel {
  final String id;
  final String nome;
  final String descricao;
  final String? userQuerAchou;
  final CategoriaModel categoria;
  final List<String> imagemUrl;
  final bool encontrado;
  final String? localEncontrado;
  final DateTime? dataItemPerdido;
  final DateTime? dataItemAchado;
  final DateTime? criationDate;

  ItemModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.categoria,
    required this.imagemUrl,
    required this.encontrado,
    this.userQuerAchou,
    this.localEncontrado,
    this.dataItemPerdido,
    this.dataItemAchado,
    this.criationDate,
  });

  ItemModel copyWith({
    String? id,
    String? nome,
    String? descricao,
    String? userQuerAchou,
    CategoriaModel? categoria,
    List<String>? imagesUrl,
    bool? encontrado,
    String? localEncontrado,
    DateTime? dataItemPerdido,
    DateTime? dataItemAchado,
    DateTime? criationDate,
  }) {
    return ItemModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      userQuerAchou: userQuerAchou ?? this.userQuerAchou,
      categoria: categoria ?? this.categoria,
      imagemUrl: imagesUrl ?? imagemUrl,
      encontrado: encontrado ?? this.encontrado,
      localEncontrado: localEncontrado ?? this.localEncontrado,
      dataItemPerdido: dataItemPerdido ?? this.dataItemPerdido,
      dataItemAchado: dataItemAchado ?? this.dataItemAchado,
      criationDate: criationDate ?? this.criationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'userQuerAchou': userQuerAchou,
      'categoria': categoria.toMap(),
      'imagesUrl': imagemUrl,
      'encontrado': encontrado,
      'localEncontrado': localEncontrado,
      'dataItemPerdido': dataItemPerdido?.millisecondsSinceEpoch,
      'dataItemAchado': dataItemAchado?.millisecondsSinceEpoch,
      'criationDate': criationDate?.millisecondsSinceEpoch,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      userQuerAchou:
          map['userQuerAchou'] != null ? map['userQuerAchou'] as String : null,
      categoria:
          CategoriaModel.fromMap(map['categoria'] as Map<String, dynamic>),
      imagemUrl: List<String>.from(map['imagesUrl'] as List<dynamic>),
      encontrado: map['encontrado'] as bool,
      localEncontrado: map['localEncontrado'] != null
          ? map['localEncontrado'] as String
          : null,
      dataItemPerdido: map['dataItemPerdido'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataItemPerdido'] as int)
          : null,
      dataItemAchado: map['dataItemAchado'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataItemAchado'] as int)
          : null,
      criationDate: map['criationDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['criationDate'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, nome: $nome, descricao: $descricao, userQuerAchou: $userQuerAchou, categoria: $categoria, imagesUrl: $imagemUrl, encontrado: $encontrado, localEncontrado: $localEncontrado, dataItemPerdido: $dataItemPerdido, dataItemAchado: $dataItemAchado, criationDate: $criationDate)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.userQuerAchou == userQuerAchou &&
        other.categoria == categoria &&
        listEquals(other.imagemUrl, imagemUrl) &&
        other.encontrado == encontrado &&
        other.localEncontrado == localEncontrado &&
        other.dataItemPerdido == dataItemPerdido &&
        other.dataItemAchado == dataItemAchado &&
        other.criationDate == criationDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        userQuerAchou.hashCode ^
        categoria.hashCode ^
        imagemUrl.hashCode ^
        encontrado.hashCode ^
        localEncontrado.hashCode ^
        dataItemPerdido.hashCode ^
        dataItemAchado.hashCode ^
        criationDate.hashCode;
  }
}
