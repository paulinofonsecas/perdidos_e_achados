part of 'gestao_encomendas_feitas_cubit.dart';

sealed class GestaoEncomendasFeitasState extends Equatable {
  const GestaoEncomendasFeitasState();

  @override
  List<Object> get props => [];
}

final class GestaoEncomendasFeitasInitial extends GestaoEncomendasFeitasState {}

final class GestaoEncomendasFeitasLoading extends GestaoEncomendasFeitasState {}

final class GestaoEncomendasFeitasError extends GestaoEncomendasFeitasState {
  const GestaoEncomendasFeitasError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class GestaoEncomendasFeitasSuccess extends GestaoEncomendasFeitasState {
  const GestaoEncomendasFeitasSuccess({required this.encomendas});
  final List<EncomendaModel> encomendas;

  @override
  List<Object> get props => [encomendas];
}
