part of 'nome_field_cubit.dart';

sealed class NomeFieldState extends Equatable {
  const NomeFieldState(this.nome);

  final String nome;

  @override
  List<Object> get props => [nome];
}

final class NomeFieldInitial extends NomeFieldState {
  const NomeFieldInitial() : super('');
}

final class NomeFieldValid extends NomeFieldState {
  const NomeFieldValid(super.nome);
}
