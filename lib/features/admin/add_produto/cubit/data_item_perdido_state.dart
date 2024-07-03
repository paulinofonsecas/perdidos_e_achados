part of 'data_item_perdido_cubit.dart';

sealed class DataItemPerdidoState extends Equatable {
  const DataItemPerdidoState();

  @override
  List<Object> get props => [];
}

final class DataItemPerdidoInitial extends DataItemPerdidoState {}

final class DataItemPerdidoDateChanged extends DataItemPerdidoState {
  const DataItemPerdidoDateChanged(this.date);

  final DateTime date;

  @override
  List<Object> get props => [date];
}
