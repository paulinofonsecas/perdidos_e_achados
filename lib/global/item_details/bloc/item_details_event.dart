part of 'item_details_bloc.dart';

abstract class ItemDetailsEvent  extends Equatable {
  const ItemDetailsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_item_details_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomItemDetailsEvent extends ItemDetailsEvent {
  /// {@macro custom_item_details_event}
  const CustomItemDetailsEvent();
}
