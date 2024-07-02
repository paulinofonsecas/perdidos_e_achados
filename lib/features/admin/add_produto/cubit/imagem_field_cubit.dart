import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'imagem_field_state.dart';

class ImagemFieldCubit extends Cubit<ImagemFieldState> {
  ImagemFieldCubit() : super(ImagemFieldInitial());

  void onChanged(List<dynamic> images) {
    emit(ImagemFieldChanged(List<String>.from(images)));
  }
}
