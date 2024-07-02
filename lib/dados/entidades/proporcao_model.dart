// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProporcaoModel {
  final String id;
  final String descricao;
  ProporcaoModel({
    required this.id,
    required this.descricao,
  });

  ProporcaoModel copyWith({
    String? id,
    String? descricao,
  }) {
    return ProporcaoModel(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
    };
  }

  factory ProporcaoModel.fake() {
    return ProporcaoModel(
      id: 'id',
      descricao: 'descricao',
    );
  }

  factory ProporcaoModel.fromMap(Map<String, dynamic> map) {
    return ProporcaoModel(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProporcaoModel.fromJson(String source) =>
      ProporcaoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProporcaoModel(id: $id, descricao: $descricao)';

  @override
  bool operator ==(covariant ProporcaoModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.descricao == descricao;
  }

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}
