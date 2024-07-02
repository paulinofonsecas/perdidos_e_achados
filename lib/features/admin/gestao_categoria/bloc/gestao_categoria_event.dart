part of 'gestao_categoria_bloc.dart';

abstract class GestaoCategoriaEvent  extends Equatable {
  const GestaoCategoriaEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_gestao_categoria_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGestaoCategoriaEvent extends GestaoCategoriaEvent {
  /// {@macro custom_gestao_categoria_event}
  const CustomGestaoCategoriaEvent();
}
