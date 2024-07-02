part of 'gestao_encomenda_bloc.dart';

abstract class GestaoEncomendaEvent extends Equatable {
  const GestaoEncomendaEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_gestao_encomenda_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class GestaoEncomendaGetAllEvent extends GestaoEncomendaEvent {
  const GestaoEncomendaGetAllEvent();
}

class GestaoEncomendaUpdateEvent extends GestaoEncomendaEvent {
  const GestaoEncomendaUpdateEvent({
    required this.encomenda,
    required this.estaEmAndamento,
  });

  final EncomendaModel encomenda;
  final bool estaEmAndamento;
}
