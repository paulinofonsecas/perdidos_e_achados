part of 'encomenda_bloc.dart';

abstract class EncomendaEvent extends Equatable {
  const EncomendaEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_encomenda_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class EncomendarEvent extends EncomendaEvent {
  const EncomendarEvent(this.localizacao, this.item, this.numero);

  final String localizacao;
  final ItemModel item;
  final String numero;

  @override
  List<Object> get props => [
        localizacao,
        item,
        numero,
      ];
}
