part of 'disponibilidade_field_cubit.dart';

sealed class DisponibilidadeFieldState extends Equatable {
  const DisponibilidadeFieldState({required this.disponibilidade});

  final bool disponibilidade;
  @override
  List<Object> get props => [disponibilidade];
}

final class DisponibilidadeFieldInitial extends DisponibilidadeFieldState {
  const DisponibilidadeFieldInitial() : super(disponibilidade: true);
}

final class DisponibilidadeFieldChanged extends DisponibilidadeFieldState {
  const DisponibilidadeFieldChanged({required super.disponibilidade});
}
