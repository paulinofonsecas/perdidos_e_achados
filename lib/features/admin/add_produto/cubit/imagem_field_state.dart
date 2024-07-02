part of 'imagem_field_cubit.dart';

sealed class ImagemFieldState extends Equatable {
  const ImagemFieldState();

  @override
  List<Object> get props => [];
}

final class ImagemFieldInitial extends ImagemFieldState {}

final class ImagemFieldChanged extends ImagemFieldState {
  const ImagemFieldChanged(this.imagens);
  final List<String> imagens;

  @override
  List<Object> get props => [imagens];
}
