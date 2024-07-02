import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailInitial()) {
    on<CustomProductDetailEvent>(_onCustomProductDetailEvent);
  }

  FutureOr<void> _onCustomProductDetailEvent(
    CustomProductDetailEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    // TODO: Add Logic
  }
}
