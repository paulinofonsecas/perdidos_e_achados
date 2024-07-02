part of 'categoria_field_cubit.dart';

sealed class CategoriaFieldState extends Equatable {
  const CategoriaFieldState();

  @override
  List<Object> get props => [];
}

final class CategoriaFieldInitial extends CategoriaFieldState {}

final class CategoriaFieldChange extends CategoriaFieldState {
  const CategoriaFieldChange(this.value);
  final CategoriaModel value;

  @override
  List<Object> get props => [value];
}
