part of 'gestao_produtos_bloc.dart';

abstract class GestaoProdutosEvent extends Equatable {
  const GestaoProdutosEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_gestao_produtos_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class GetAllProdutosEvent extends GestaoProdutosEvent {
  const GetAllProdutosEvent({
    this.inCache = true,
  });

  final bool inCache;
}
