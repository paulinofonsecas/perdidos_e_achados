part of 'add_produto_bloc.dart';

abstract class AddProdutoEvent extends Equatable {
  const AddProdutoEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_add_produto_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class AddNewProdutoEvent extends AddProdutoEvent {
  const AddNewProdutoEvent(this.context);

  final BuildContext context;

  @override
  List<Object> get props => [context];
}
