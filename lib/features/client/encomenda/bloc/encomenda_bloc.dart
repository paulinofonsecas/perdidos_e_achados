import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/encomenda.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/entidades/local_user.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/dados/servicos/encomenda_firebase.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:uuid/uuid.dart';

part 'encomenda_event.dart';
part 'encomenda_state.dart';

class EncomendaBloc extends Bloc<EncomendaEvent, EncomendaState> {
  EncomendaBloc() : super(EncomendaInitial()) {
    on<EncomendarEvent>(_onEncomendarEvent);
  }

  FutureOr<void> _onEncomendarEvent(
    EncomendarEvent event,
    Emitter<EncomendaState> emit,
  ) async {
    emit(EncomendaLoading());
    final encomendaFirebase = EncomendaFirebase.instance;

    final userId = getIt<LocalUser>().id;
    final encomenda = EncomendaModel(
      id: const Uuid().v4(),
      userId: userId,
      produto: event.item,
      localizacao: event.localizacao,
      numero: event.numero,
      resgatadoDate: DateTime.now(),
    );

    await encomendaFirebase
        .addEncomenda(encomenda)
        .then((value) => emit(EncomendaSuccess()))
        .onError(
          (e, t) => emit(EncomendaError(message: e.toString())),
        );
  }
}
