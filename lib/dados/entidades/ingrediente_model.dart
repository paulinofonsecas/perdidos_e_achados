// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IngredienteModel {
  final String id;
  final String descricao;
  IngredienteModel({
    required this.id,
    required this.descricao,
  });

  IngredienteModel copyWith({
    String? id,
    String? descricao,
  }) {
    return IngredienteModel(
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

  factory IngredienteModel.fake() {
    return IngredienteModel(
      id: 'id',
      descricao: 'descricao',
    );
  }

  factory IngredienteModel.fromMap(Map<String, dynamic> map) {
    return IngredienteModel(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IngredienteModel.fromJson(String source) =>
      IngredienteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IngredienteModel(id: $id, descricao: $descricao)';

  @override
  bool operator ==(covariant IngredienteModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.descricao == descricao;
  }

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}
