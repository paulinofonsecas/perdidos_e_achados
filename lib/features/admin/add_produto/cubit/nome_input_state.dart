part of 'nome_input_cubit.dart';

sealed class NomeInputState extends Equatable {
  const NomeInputState();

  @override
  List<Object> get props => [];
}

final class NomeInputInitial extends NomeInputState {}

final class NomeInputChanged extends NomeInputState {
  const NomeInputChanged({required this.nome});

  final String nome;

  @override
  List<String> get props => [nome];
}
