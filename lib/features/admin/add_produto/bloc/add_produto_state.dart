part of 'add_produto_bloc.dart';

/// {@template add_produto_state}
/// AddProdutoState description
/// {@endtemplate}
class AddProdutoState extends Equatable {
  /// {@macro add_produto_state}
  const AddProdutoState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddProdutoState with property changes
  AddProdutoState copyWith({
    String? customProperty,
  }) {
    return AddProdutoState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template add_produto_initial}
/// The initial state of AddProdutoState
/// {@endtemplate}
class AddProdutoInitial extends AddProdutoState {
  /// {@macro add_produto_initial}
  const AddProdutoInitial() : super();
}

class AddNewProdutoLoading extends AddProdutoState {
  const AddNewProdutoLoading() : super();
}

class AddNewProdutoSuccess extends AddProdutoState {
  /// {@macro add_produto_initial}
  const AddNewProdutoSuccess() : super();
}

class AddNewProdutoError extends AddProdutoState {
  const AddNewProdutoError(this.message) : super();

  final String message;
}
