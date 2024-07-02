import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/admin/add_produto/bloc/bloc.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/categoria_field_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/descricao_input_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/disponibilidade_field_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/imagem_field_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/nome_input_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/preco_input_cubit.dart';
import 'package:gestao_restaurante/features/admin/add_produto/widgets/add_produto_body.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/gestao_produtos.dart';

/// {@template add_produto_page}
/// A description for AddProdutoPage
/// {@endtemplate}
class AddProdutoPage extends StatelessWidget {
  /// {@macro add_produto_page}
  const AddProdutoPage({super.key});

  /// The static route for AddProdutoPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddProdutoPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddProdutoBloc(),
        ),
        BlocProvider(
          create: (context) => NomeInputCubit(),
        ),
        BlocProvider(
          create: (context) => DescricaoInputCubit(),
        ),
        BlocProvider(
          create: (context) => PrecoInputCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriaFieldCubit(),
        ),
        BlocProvider(
          create: (context) => DisponibilidadeFieldCubit(),
        ),
        BlocProvider(
          create: (context) => ImagemFieldCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Adicionar Produto'),
              actions: [
                TextButton.icon(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    context
                        .read<AddProdutoBloc>()
                        .add(AddNewProdutoEvent(context));
                  },
                  label: const Text('Salvar'),
                ),
              ],
            ),
            body: const AddProdutoView(),
          );
        },
      ),
    );
  }
}

/// {@template add_produto_view}
/// Displays the Body of AddProdutoView
/// {@endtemplate}
class AddProdutoView extends StatelessWidget {
  /// {@macro add_produto_view}
  const AddProdutoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProdutoBloc, AddProdutoState>(
      listener: (context, state) {
        if (state is AddNewProdutoError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.message)),
            );
        }

        if (state is AddNewProdutoSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Produto adicionado')),
            );

          context.read<GestaoProdutosBloc>().add(const GetAllProdutosEvent());
        }
      },
      child: const AddProdutoBody(),
    );
  }
}
