// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/features/client/encomenda/bloc/encomenda_bloc.dart';

/// {@template encomenda_body}
/// Body of the EncomendaPage.
///
/// Add what it does
/// {@endtemplate}
class EncomendaBody extends StatefulWidget {
  /// {@macro encomenda_body}
  const EncomendaBody({
    required this.produto,
    super.key,
  });

  final ProdutoModel produto;

  @override
  State<EncomendaBody> createState() => _EncomendaBodyState();
}

class _EncomendaBodyState extends State<EncomendaBody> {
  final TextEditingController _localicaoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EncomendaBloc, EncomendaState>(
      listener: (context, state) {
        if (state is EncomendaSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Encomenda realizada com sucesso'),
            ),
          );
        }
      },
      child: BlocBuilder<EncomendaBloc, EncomendaState>(
        builder: (context, state) {
          if (state is EncomendaInitial) {
            return _EncomendaForm(
              produto: widget.produto,
              formKey: _formKey,
              localicaoController: _localicaoController,
              numeroController: _numeroController,
            );
          }

          if (state is EncomendaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is EncomendaError) {
            return Center(
              child: Text(state.message),
            );
          }

          return _EncomendaForm(
            produto: widget.produto,
            formKey: _formKey,
            localicaoController: _localicaoController,
            numeroController: _numeroController,
          );
        },
      ),
    );
  }
}

class _EncomendaForm extends StatelessWidget {
  const _EncomendaForm({
    required this.produto,
    required this.formKey,
    required this.localicaoController,
    required this.numeroController,
  });

  final ProdutoModel produto;
  final GlobalKey<FormState> formKey;
  final TextEditingController localicaoController;
  final TextEditingController numeroController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Fazer encomenda',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const GutterLarge(),
            TextFormField(
              controller: localicaoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, informe sua localização';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Localização de entrega',
                hintText: 'Ex: Cuito, Rua Silva porto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                prefixIcon: Icon(Icons.map_outlined),
              ),
            ),
            const Gutter(),
            TextFormField(
              controller: numeroController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, informe o número de telefone';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nº telefone',
                hintText: 'Ex: 925412030',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),
            const GutterLarge(),
            FilledButton.icon(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<EncomendaBloc>().add(
                        EncomendarEvent(
                          'Cuito, Rua Silva porto',
                          produto,
                          '925412030',
                        ),
                      );
                }
              },
              label: const Text('Encomendar'),
              icon: const Icon(Icons.restaurant_menu_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
