part of 'best_sallers_horizontal_cubit.dart';

sealed class BestSallersHorizontalState extends Equatable {
  const BestSallersHorizontalState();

  @override
  List<Object> get props => [];
}

final class BestSallersHorizontalInitial extends BestSallersHorizontalState {}

final class BestSallersHorizontalLoading extends BestSallersHorizontalState {}

final class BestSallersHorizontalEmpty extends BestSallersHorizontalState {}

final class BestSallersHorizontalSuccess extends BestSallersHorizontalState {
  const BestSallersHorizontalSuccess({required this.bestSallers});
  final List<ProdutoModel> bestSallers;

  @override
  List<Object> get props => [bestSallers];
}

final class BestSallersHorizontalError extends BestSallersHorizontalState {
  const BestSallersHorizontalError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
