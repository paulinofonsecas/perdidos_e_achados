import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'gestao_categoria_event.dart';
part 'gestao_categoria_state.dart';

class GestaoCategoriaBloc extends Bloc<GestaoCategoriaEvent, GestaoCategoriaState> {
  GestaoCategoriaBloc() : super(const GestaoCategoriaInitial()) {
    on<CustomGestaoCategoriaEvent>(_onCustomGestaoCategoriaEvent);
  }

  FutureOr<void> _onCustomGestaoCategoriaEvent(
    CustomGestaoCategoriaEvent event,
    Emitter<GestaoCategoriaState> emit,
  ) {
    // TODO: Add Logic
  }
}
