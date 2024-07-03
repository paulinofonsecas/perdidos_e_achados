part of 'global_search_categoria_bloc.dart';

/// {@template global_search_categoria_state}
/// GlobalSearchCategoriaState description
/// {@endtemplate}
class GlobalSearchCategoriaState extends Equatable {
  /// {@macro global_search_categoria_state}
  const GlobalSearchCategoriaState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GlobalSearchCategoriaState with property changes
  GlobalSearchCategoriaState copyWith({
    String? customProperty,
  }) {
    return GlobalSearchCategoriaState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template global_search_categoria_initial}
/// The initial state of GlobalSearchCategoriaState
/// {@endtemplate}
class GlobalSearchCategoriaInitial extends GlobalSearchCategoriaState {
  /// {@macro global_search_categoria_initial}
  const GlobalSearchCategoriaInitial() : super();
}

class GlobalSearchCategoriaLoading extends GlobalSearchCategoriaState {
  const GlobalSearchCategoriaLoading() : super();
}

class GlobalSearchCategoriaEmpty extends GlobalSearchCategoriaState {}

class GlobalSearchCategoriaSuccess extends GlobalSearchCategoriaState {
  /// {@macro gestao_produtos_initial}
  const GlobalSearchCategoriaSuccess(this.items) : super();

  final List<ItemModel> items;

  @override
  List<Object> get props => [items];
}

class GlobalSearchCategoriaError extends GlobalSearchCategoriaState {
  /// {@macro gestao_produtos_initial}
  const GlobalSearchCategoriaError(this.message) : super();

  final String message;

  @override
  List<Object> get props => [message];
}
