import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/encomenda.dart';
import 'package:gestao_restaurante/dados/servicos/encomenda_firebase.dart';

part 'gestao_encomendas_state.dart';

class GestaoEncomendasCubit extends Cubit<GestaoEncomendasState> {
  GestaoEncomendasCubit() : super(GestaoEncomendasInitial());

  Future<void> encomendasEmAndamento() async {
    emit(GestaoEncomendasLoading());
    final encomendaFirebase = EncomendaFirebase.instance;

    await encomendaFirebase
        .getEncomendas()
        .then(
          (value) => emit(
            GestaoEncomendasSuccess(
              encomendas: value.where((e) => true).toList(),
            ),
          ),
        )
        .onError(
          (e, t) => emit(GestaoEncomendasError(message: e.toString())),
        );
  }
}
