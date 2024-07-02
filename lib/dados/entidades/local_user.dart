// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocalUser {
  final String id;
  final String nome;
  final String email;
  final String role;

  LocalUser({
    required this.id,
    required this.nome,
    required this.email,
    required this.role,
  });

  LocalUser copyWith({
    String? id,
    String? nome,
    String? email,
    String? role,
  }) {
    return LocalUser(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'role': role,
    };
  }

  factory LocalUser.fromMap(Map<String, dynamic> map) {
    return LocalUser(
      id: map['id'] as String,
      nome: map['nome'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalUser.fromJson(String source) =>
      LocalUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocalUser(id: $id, nome: $nome, email: $email, role: $role)';
  }

  @override
  bool operator ==(covariant LocalUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.email == email &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ email.hashCode ^ role.hashCode;
  }
}
