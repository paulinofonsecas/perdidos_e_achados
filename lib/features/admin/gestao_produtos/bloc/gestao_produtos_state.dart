part of 'gestao_produtos_bloc.dart';

/// {@template gestao_produtos_state}
/// GestaoProdutosState description
/// {@endtemplate}
class GestaoProdutosState extends Equatable {
  /// {@macro gestao_produtos_state}
  const GestaoProdutosState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GestaoProdutosState with property changes
  GestaoProdutosState copyWith({
    String? customProperty,
  }) {
    return GestaoProdutosState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template gestao_produtos_initial}
/// The initial state of GestaoProdutosState
/// {@endtemplate}
class GestaoProdutosInitial extends GestaoProdutosState {
  /// {@macro gestao_produtos_initial}
  const GestaoProdutosInitial() : super();
}

class GetAllProdutosLoading extends GestaoProdutosState {
  /// {@macro gestao_produtos_initial}
  const GetAllProdutosLoading() : super();
}

class GetAllProdutosEmpty extends GestaoProdutosState {}

class GetAllProdutosSuccess extends GestaoProdutosState {
  /// {@macro gestao_produtos_initial}
  const GetAllProdutosSuccess(this.produtos) : super();

  final List<ProdutoModel> produtos;

  @override
  List<Object> get props => [produtos];
}

class GetAllProdutosError extends GestaoProdutosState {
  /// {@macro gestao_produtos_initial}
  const GetAllProdutosError(this.message) : super();

  final String message;

  @override
  List<Object> get props => [message];
}
