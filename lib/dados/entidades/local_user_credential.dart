// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:uuid/uuid.dart';

class LocalUserCredential {
  final String id;
  final String email;
  final String password;
  final String? nome;
  final String? role;

  LocalUserCredential({
    required this.id,
    required this.email,
    required this.password,
    this.nome,
    this.role,
  });

  LocalUserCredential copyWith({
    String? id,
    String? email,
    String? password,
    String? nome,
    String? role,
  }) {
    return LocalUserCredential(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      nome: nome ?? this.nome,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'nome': nome,
      'role': role,
    };
  }

  factory LocalUserCredential.make({
    required String email,
    required String password,
    String? nome,
    String? role,
  }) {
    return LocalUserCredential(
      id: const Uuid().v4(),
      email: email,
      password: password,
      nome: nome,
      role: role,
    );
  }

  factory LocalUserCredential.fromMap(Map<String, dynamic> map) {
    return LocalUserCredential(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      nome: map['nome'] != null ? map['nome'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalUserCredential.fromJson(String source) =>
      LocalUserCredential.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocalUserCredential(id: $id, email: $email, password: $password, nome: $nome, role: $role)';
  }

  @override
  bool operator ==(covariant LocalUserCredential other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.password == password &&
        other.nome == nome &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        password.hashCode ^
        nome.hashCode ^
        role.hashCode;
  }
}
