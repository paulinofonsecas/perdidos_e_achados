import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/dados/servicos/produto_firebase.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/categoria_field_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/descricao_input_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/disponibilidade_field_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/imagem_field_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/nome_input_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/preco_input_cubit.dart';
import 'package:uuid/uuid.dart';

part 'add_produto_event.dart';
part 'add_produto_state.dart';

class AddProdutoBloc extends Bloc<AddProdutoEvent, AddProdutoState> {
  AddProdutoBloc() : super(const AddProdutoInitial()) {
    on<AddNewProdutoEvent>(_onAddNewProdutoEvent);
  }

  FutureOr<void> _onAddNewProdutoEvent(
    AddNewProdutoEvent event,
    Emitter<AddProdutoState> emit,
  ) async {
    emit(const AddNewProdutoLoading());

    final context = event.context;

    final nome = _getNomeFieldValue(context);
    final descricao = _getDescricaoFieldValue(context);
    final preco = _getPrecoFieldValue(context);
    final categoria = _getCategoriaFieldValue(context);
    final disponibilidade = _getDisponibilidadeFieldValue(context);
    final imagens = _getImagensFieldValue(context);

    final produto = ProdutoModel(
      id: const Uuid().v4(),
      nome: nome!,
      descricao: descricao!,
      preco: preco!,
      categoria: categoria!,
      disponibilidade: disponibilidade,
      imagemUrl: imagens!,
    );

    final pf = ProdutoFirebase.instance;

    await pf.addProduto(produto).then((value) {
      emit(const AddNewProdutoSuccess());
    }).onError((error, stackTrace) {
      emit(const AddNewProdutoError('Erro ao adicionar o novo livro'));
    });
  }

  String? _getNomeFieldValue(BuildContext context) {
    if (context.read<NomeInputCubit>().state is! NomeInputChanged) {
      return null;
    }

    final nome =
        (context.read<NomeInputCubit>().state as NomeInputChanged).nome;

    if (nome.isEmpty) {
      return null;
    }

    return nome;
  }

  String? _getDescricaoFieldValue(BuildContext context) {
    if (context.read<DescricaoInputCubit>().state is! DescricaoInputChanged) {
      return null;
    }

    final descricao =
        (context.read<DescricaoInputCubit>().state as DescricaoInputChanged)
            .descricao;

    if (descricao.isEmpty) {
      return null;
    }

    return descricao;
  }

  double? _getPrecoFieldValue(BuildContext context) {
    if (context.read<PrecoInputCubit>().state is! PrecoInputChanged) {
      return null;
    }

    final preco =
        (context.read<PrecoInputCubit>().state as PrecoInputChanged).preco;

    return preco;
  }

  CategoriaModel? _getCategoriaFieldValue(BuildContext context) {
    if (context.read<CategoriaFieldCubit>().state is! CategoriaFieldChange) {
      return null;
    }

    final categoria =
        (context.read<CategoriaFieldCubit>().state as CategoriaFieldChange)
            .value;

    return categoria;
  }

  bool _getDisponibilidadeFieldValue(BuildContext context) {
    if (context.read<DisponibilidadeFieldCubit>().state
        is! DisponibilidadeFieldChanged) {
      return true;
    }

    final disponibilidade = (context.read<DisponibilidadeFieldCubit>().state
            as DisponibilidadeFieldChanged)
        .disponibilidade;

    return disponibilidade;
  }

  List<String>? _getImagensFieldValue(BuildContext context) {
    if (context.read<ImagemFieldCubit>().state is! ImagemFieldChanged) {
      return null;
    }

    final imagens =
        (context.read<ImagemFieldCubit>().state as ImagemFieldChanged).imagens;

    return imagens;
  }
}
