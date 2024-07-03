import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'item_details_event.dart';
part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  ItemDetailsBloc() : super(const ItemDetailsInitial()) {
    on<CustomItemDetailsEvent>(_onCustomItemDetailsEvent);
  }

  FutureOr<void> _onCustomItemDetailsEvent(
    CustomItemDetailsEvent event,
    Emitter<ItemDetailsState> emit,
  ) {
    // TODO: Add Logic
  }
}
