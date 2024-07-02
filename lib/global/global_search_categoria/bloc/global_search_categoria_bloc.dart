import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'global_search_categoria_event.dart';
part 'global_search_categoria_state.dart';

class GlobalSearchCategoriaBloc extends Bloc<GlobalSearchCategoriaEvent, GlobalSearchCategoriaState> {
  GlobalSearchCategoriaBloc() : super(const GlobalSearchCategoriaInitial()) {
    on<CustomGlobalSearchCategoriaEvent>(_onCustomGlobalSearchCategoriaEvent);
  }

  FutureOr<void> _onCustomGlobalSearchCategoriaEvent(
    CustomGlobalSearchCategoriaEvent event,
    Emitter<GlobalSearchCategoriaState> emit,
  ) {
    // TODO: Add Logic
  }
}
