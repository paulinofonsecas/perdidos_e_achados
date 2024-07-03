part of 'localizacao_input_cubit.dart';

sealed class LocalizacaoInputState extends Equatable {
  const LocalizacaoInputState();

  @override
  List<Object> get props => [];
}

final class LocalizacaoInputInitial extends LocalizacaoInputState {}

final class LocalizacaoInputChanged extends LocalizacaoInputState {
  const LocalizacaoInputChanged({required this.l});

  final String l;

  @override
  List<String> get props => [l];
}
