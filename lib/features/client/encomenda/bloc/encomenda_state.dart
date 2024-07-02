part of 'encomenda_bloc.dart';

/// {@template encomenda_state}
/// EncomendaState description
/// {@endtemplate}
class EncomendaState extends Equatable {
  /// {@macro encomenda_state}
  const EncomendaState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current EncomendaState with property changes
  EncomendaState copyWith({
    String? customProperty,
  }) {
    return EncomendaState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template encomenda_initial}
/// The initial state of EncomendaState
/// {@endtemplate}
class EncomendaInitial extends EncomendaState {}

class EncomendaLoading extends EncomendaState {}

class EncomendaSuccess extends EncomendaState {}

class EncomendaError extends EncomendaState {
  const EncomendaError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
