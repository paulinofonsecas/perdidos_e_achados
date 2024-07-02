import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/encomenda.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/bloc/bloc.dart';
import 'package:gestao_restaurante/global/widgets/global_image_network_widget.dart';

/// {@template gestao_encomenda_body}
/// Body of the GestaoEncomendaPage.
///
/// Add what it does
/// {@endtemplate}
class GestaoEncomendaBody extends StatelessWidget {
  /// {@macro gestao_encomenda_body}
  const GestaoEncomendaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<GestaoEncomendaBloc, GestaoEncomendaState>(
        listener: (context, state) {
          if (state is GestaoEncomendaUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Encomenda em processamento'),
              ),
            );

            context
                .read<GestaoEncomendaBloc>()
                .add(const GestaoEncomendaGetAllEvent());
          }
        },
        child: BlocBuilder<GestaoEncomendaBloc, GestaoEncomendaState>(
          bloc: context.read<GestaoEncomendaBloc>()
            ..add(const GestaoEncomendaGetAllEvent()),
          builder: (context, state) {
            if (state is GestaoEncomendaLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is GestaoEncomendaError) {
              return Center(child: Text(state.message));
            }

            if (state is GestaoEncomendaEmpty) {
              return const Center(child: Text('Sem encomendas cadastradas'));
            }

            if (state is GestaoEncomendaSuccess) {
              return EncomendasListviewWidget(encomendas: state.encomendas);
            }

            return const Placeholder();
          },
        ),
      ),
    );
  }
}

class EncomendasListviewWidget extends StatefulWidget {
  const EncomendasListviewWidget({required this.encomendas, super.key});

  final List<EncomendaModel> encomendas;

  @override
  State<EncomendasListviewWidget> createState() =>
      EncomendasListviewWidgetState();
}

class EncomendasListviewWidgetState extends State<EncomendasListviewWidget> {
  late final TextEditingController _searchController;
  String filter = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _searchController.addListener(() {
      setState(() {
        filter = _searchController.text;
      });
    });
  }

  List<Widget> _getEncomendasList(List<EncomendaModel> encomendas) {
    void onProcessing(EncomendaModel encomenda, bool value) {
      context.read<GestaoEncomendaBloc>().add(
            GestaoEncomendaUpdateEvent(
              encomenda: encomenda,
              estaEmAndamento: value,
            ),
          );
    }

    return encomendas
        .where(
          (e) =>
              e.localizacao.toLowerCase().contains(filter.trim().toLowerCase()),
        )
        .map(
          (encomenda) => ListTile(
            title: Text(encomenda.produto.nome),
            subtitle: Text(encomenda.localizacao),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton.filledTonal(
                  icon: const Icon(Icons.close_outlined),
                  onPressed: () {
                    onProcessing(encomenda, true);
                  },
                ),
                const GutterTiny(),
                IconButton.filledTonal(
                  icon: const Icon(Icons.done_outline),
                  onPressed: () {
                    onProcessing(encomenda, false);
                  },
                ),
              ],
            ),
            leading: GlobalImageNetworkWidget(
              encomenda.produto.imagemUrl.first,
              width: 60,
              height: 60,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.encomendas.length);
    return Column(
      children: [
        _SearchFieldWidget(_searchController),
        ..._getEncomendasList(
          widget.encomendas,
        ),
      ],
    );
  }
}

class _SearchFieldWidget extends StatelessWidget {
  const _SearchFieldWidget(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Pesquisar',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: controller.clear,
                )
              : null,
        ),
      ),
    );
  }
}
