part of 'fielter_cubit.dart';

sealed class FilterState extends Equatable {
  const FilterState({required this.ordenacao});
  final Ordenacao ordenacao;

  @override
  List<Object> get props => [ordenacao];
}

final class FilterInitial extends FilterState {
  const FilterInitial({required super.ordenacao});
}

final class FilterChanged extends FilterState {
  const FilterChanged({required super.ordenacao});
}
