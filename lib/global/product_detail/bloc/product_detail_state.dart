part of 'product_detail_bloc.dart';

/// {@template product_detail_state}
/// ProductDetailState description
/// {@endtemplate}
class ProductDetailState extends Equatable {
  /// {@macro product_detail_state}
  const ProductDetailState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ProductDetailState with property changes
  ProductDetailState copyWith({
    String? customProperty,
  }) {
    return ProductDetailState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template product_detail_initial}
/// The initial state of ProductDetailState
/// {@endtemplate}
class ProductDetailInitial extends ProductDetailState {
  /// {@macro product_detail_initial}
  const ProductDetailInitial() : super();
}
