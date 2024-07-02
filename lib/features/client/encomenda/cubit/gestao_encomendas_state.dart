part of 'gestao_encomendas_cubit.dart';

sealed class GestaoEncomendasState extends Equatable {
  const GestaoEncomendasState();

  @override
  List<Object> get props => [];
}

final class GestaoEncomendasInitial extends GestaoEncomendasState {}

final class GestaoEncomendasLoading extends GestaoEncomendasState {}

final class GestaoEncomendasError extends GestaoEncomendasState {
  const GestaoEncomendasError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class GestaoEncomendasSuccess extends GestaoEncomendasState {
  const GestaoEncomendasSuccess({required this.encomendas});
  final List<EncomendaModel> encomendas;

  @override
  List<Object> get props => [encomendas];
}
