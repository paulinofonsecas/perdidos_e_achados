// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PromocaoModel {
  final String id;
  final String descricao;
  final String imagemUrl;
  final int percentualDeDesconto;

  PromocaoModel({
    required this.id,
    required this.descricao,
    required this.imagemUrl,
    required this.percentualDeDesconto,
  });

  PromocaoModel copyWith({
    String? id,
    String? descricao,
    String? imagemUrl,
    int? percentualDeDesconto,
  }) {
    return PromocaoModel(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      imagemUrl: imagemUrl ?? this.imagemUrl,
      percentualDeDesconto: percentualDeDesconto ?? this.percentualDeDesconto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'imagemUrl': imagemUrl,
      'percentualDeDesconto': percentualDeDesconto,
    };
  }

  factory PromocaoModel.fake({
    String descricao = 'descricao',
    String imagemUrl =
        'https://images.pexels.com/photos/1591373/pexels-photo-1591373.'
            'jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    int percentualDeDesconto = 10,
  }) {
    return PromocaoModel(
      id: 'id',
      imagemUrl: imagemUrl,
      percentualDeDesconto: percentualDeDesconto,
      descricao: descricao,
    );
  }

  factory PromocaoModel.fromMap(Map<String, dynamic> map) {
    return PromocaoModel(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
      imagemUrl: map['imagemUrl'] as String,
      percentualDeDesconto: map['percentualDeDesconto'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PromocaoModel.fromJson(String source) =>
      PromocaoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PromocaoModel(id: $id, descricao: $descricao, imagemUrl: $imagemUrl, percentualDeDesconto: $percentualDeDesconto)';
  }

  @override
  bool operator ==(covariant PromocaoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.descricao == descricao &&
        other.imagemUrl == imagemUrl &&
        other.percentualDeDesconto == percentualDeDesconto;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        descricao.hashCode ^
        imagemUrl.hashCode ^
        percentualDeDesconto.hashCode;
  }
}
