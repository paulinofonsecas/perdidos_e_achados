part of 'gestao_categoria_bloc.dart';

/// {@template gestao_categoria_state}
/// GestaoCategoriaState description
/// {@endtemplate}
class GestaoCategoriaState extends Equatable {
  /// {@macro gestao_categoria_state}
  const GestaoCategoriaState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GestaoCategoriaState with property changes
  GestaoCategoriaState copyWith({
    String? customProperty,
  }) {
    return GestaoCategoriaState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template gestao_categoria_initial}
/// The initial state of GestaoCategoriaState
/// {@endtemplate}
class GestaoCategoriaInitial extends GestaoCategoriaState {
  /// {@macro gestao_categoria_initial}
  const GestaoCategoriaInitial() : super();
}
