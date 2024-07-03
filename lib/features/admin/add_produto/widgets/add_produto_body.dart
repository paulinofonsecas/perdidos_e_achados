import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/features/admin/add_produto/add_produto.dart';
import 'package:gestao_restaurante/features/admin/add_produto/widgets/categoria_input_field.dart';
import 'package:gestao_restaurante/features/admin/add_produto/widgets/data_item_perdido_input_field.dart';
import 'package:gestao_restaurante/features/admin/add_produto/widgets/descricao_input_field.dart';
import 'package:gestao_restaurante/features/admin/add_produto/widgets/imagem_input_field.dart';
import 'package:gestao_restaurante/features/admin/add_produto/widgets/local_do_item_perdido_input_field.dart';
import 'package:gestao_restaurante/features/admin/add_produto/widgets/nome_input_field.dart';

/// {@template add_produto_body}
/// Body of the AddProdutoPage.
///
/// Add what it does
/// {@endtemplate}
class AddProdutoBody extends StatefulWidget {
  /// {@macro add_produto_body}
  const AddProdutoBody({super.key});

  @override
  State<AddProdutoBody> createState() => _AddProdutoBodyState();
}

class _AddProdutoBodyState extends State<AddProdutoBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: BlocBuilder<AddProdutoBloc, AddProdutoState>(
        builder: (context, state) {
          if (state is AddNewProdutoLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AddNewProdutoError) {
            return Center(child: Text(state.message));
          }

          return SingleChildScrollView(
            child: Form(
              key: context.read<AddProdutoBloc>().formKey,
              child: const Column(
                children: [
                  NomeInputField(),
                  Gutter(),
                  DescricaoInputField(),
                  Gutter(),
                  LocalDoItemPerdidoInputField(),
                  Gutter(),
                  CategoriaInputField(),
                  Gutter(),
                  DataItemPerdidoInputField(),
                  Gutter(),
                  ImagemInputField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
