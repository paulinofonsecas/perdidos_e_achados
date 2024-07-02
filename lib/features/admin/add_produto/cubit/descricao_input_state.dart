part of 'descricao_input_cubit.dart';

sealed class DescricaoInputState extends Equatable {
  const DescricaoInputState();

  @override
  List<Object> get props => [];
}

final class DescricaoInputInitial extends DescricaoInputState {}

final class DescricaoInputChanged extends DescricaoInputState {
  const DescricaoInputChanged({required this.descricao});

  final String descricao;

  @override
  List<String> get props => [descricao];
}
