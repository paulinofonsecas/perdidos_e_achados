part of 'preco_input_cubit.dart';

sealed class PrecoInputState extends Equatable {
  const PrecoInputState();

  @override
  List<Object> get props => [];
}

final class PrecoInputInitial extends PrecoInputState {}

final class PrecoInputChanged extends PrecoInputState {
  const PrecoInputChanged({required this.preco});

  final double preco;

  @override
  List<Object> get props => [preco];
}

final class PrecoInputError extends PrecoInputState {
  const PrecoInputError(this.error);

  final String error;

  @override
  List<Object> get props => [];
}
