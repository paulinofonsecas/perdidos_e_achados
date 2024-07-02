import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/servicos/categoria_firebase.dart';

part 'categorias_horizontal_state.dart';

class CategoriasHorizontalCubit extends Cubit<CategoriasHorizontalState> {
  CategoriasHorizontalCubit() : super(CategoriasHorizontalInitial());

  Future<void> getCategorias({bool cache = true}) async {
    final cf = CategoriaFirebase();

    emit(CategoriasHorizontalLoading());

    await cf
        .getCategorias(cache: cache)
        .then((e) => emit(CategoriasHorizontalSuccess(categorias: e)))
        .onError(
          (e, t) => emit(CategoriasHorizontalError(message: e.toString())),
        );
  }
}
