part of 'gestao_encomenda_bloc.dart';

/// {@template gestao_encomenda_state}
/// GestaoEncomendaState description
/// {@endtemplate}
class GestaoEncomendaState extends Equatable {
  /// {@macro gestao_encomenda_state}
  const GestaoEncomendaState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GestaoEncomendaState with property changes
  GestaoEncomendaState copyWith({
    String? customProperty,
  }) {
    return GestaoEncomendaState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template gestao_encomenda_initial}
/// The initial state of GestaoEncomendaState
/// {@endtemplate}
class GestaoEncomendaInitial extends GestaoEncomendaState {
  /// {@macro gestao_encomenda_initial}
  const GestaoEncomendaInitial() : super();
}

class GestaoEncomendaLoading extends GestaoEncomendaState {}

class GestaoEncomendaEmpty extends GestaoEncomendaState {}

class GestaoEncomendaUpdated extends GestaoEncomendaState {}

class GestaoEncomendaSuccess extends GestaoEncomendaState {
  const GestaoEncomendaSuccess({required this.encomendas});
  final List<EncomendaModel> encomendas;

  @override
  List<Object> get props => [encomendas];
}

class GestaoEncomendaError extends GestaoEncomendaState {
  const GestaoEncomendaError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
