part of 'global_search_categoria_bloc.dart';

abstract class GlobalSearchCategoriaEvent  extends Equatable {
  const GlobalSearchCategoriaEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_global_search_categoria_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGlobalSearchCategoriaEvent extends GlobalSearchCategoriaEvent {
  /// {@macro custom_global_search_categoria_event}
  const CustomGlobalSearchCategoriaEvent();
}
