part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent  extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_product_detail_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomProductDetailEvent extends ProductDetailEvent {
  /// {@macro custom_product_detail_event}
  const CustomProductDetailEvent();
}
