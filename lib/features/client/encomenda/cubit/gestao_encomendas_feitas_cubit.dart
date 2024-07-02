import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/encomenda.dart';
import 'package:gestao_restaurante/dados/servicos/encomenda_firebase.dart';

part 'gestao_encomendas_feitas_state.dart';

class GestaoEncomendasFeitasCubit extends Cubit<GestaoEncomendasFeitasState> {
  GestaoEncomendasFeitasCubit() : super(GestaoEncomendasFeitasInitial());

  Future<void> encomendasFeitas() async {
    emit(GestaoEncomendasFeitasLoading());
    final encomendaFirebase = EncomendaFirebase.instance;

    await encomendaFirebase
        .getEncomendas()
        .then(
          (value) => emit(
            GestaoEncomendasFeitasSuccess(
              encomendas: value.where((e) => !e.estaEmAndamento).toList(),
            ),
          ),
        )
        .onError(
          (e, t) => emit(GestaoEncomendasFeitasError(message: e.toString())),
        );
  }
}
