import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/encomenda.dart';
import 'package:gestao_restaurante/dados/servicos/encomenda_firebase.dart';

part 'gestao_encomenda_event.dart';
part 'gestao_encomenda_state.dart';

class GestaoEncomendaBloc
    extends Bloc<GestaoEncomendaEvent, GestaoEncomendaState> {
  GestaoEncomendaBloc() : super(const GestaoEncomendaInitial()) {
    on<GestaoEncomendaGetAllEvent>(_onCustomGestaoEncomendaEvent);
    on<GestaoEncomendaUpdateEvent>(_onGestaoEncomendaUpdateEvent);
  }

  FutureOr<void> _onCustomGestaoEncomendaEvent(
    GestaoEncomendaGetAllEvent event,
    Emitter<GestaoEncomendaState> emit,
  ) async {
    emit(GestaoEncomendaLoading());
    final encomendaFirebase = EncomendaFirebase.instance;

    final result = await encomendaFirebase.getEncomendas();

    emit(GestaoEncomendaSuccess(encomendas: result));
  }

  FutureOr<void> _onGestaoEncomendaUpdateEvent(
    GestaoEncomendaUpdateEvent event,
    Emitter<GestaoEncomendaState> emit,
  ) async {
    emit(GestaoEncomendaLoading());
    final encomendaFirebase = EncomendaFirebase.instance;

    final encomenda = event.encomenda.copyWith(
      estaEmAndamento: event.estaEmAndamento,
    );

    await encomendaFirebase
        .addEncomenda(encomenda)
        .then((value) => emit(GestaoEncomendaUpdated()))
        .onError(
          (e, t) => emit(GestaoEncomendaError(message: e.toString())),
        );
  }
}
