part of 'item_details_bloc.dart';

/// {@template item_details_state}
/// ItemDetailsState description
/// {@endtemplate}
class ItemDetailsState extends Equatable {
  /// {@macro item_details_state}
  const ItemDetailsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ItemDetailsState with property changes
  ItemDetailsState copyWith({
    String? customProperty,
  }) {
    return ItemDetailsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template item_details_initial}
/// The initial state of ItemDetailsState
/// {@endtemplate}
class ItemDetailsInitial extends ItemDetailsState {
  /// {@macro item_details_initial}
  const ItemDetailsInitial() : super();
}
