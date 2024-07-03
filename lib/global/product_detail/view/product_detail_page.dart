// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:gestao_restaurante/global/product_detail/bloc/bloc.dart';
import 'package:gestao_restaurante/global/product_detail/widgets/product_detail_body.dart';

/// {@template product_detail_page}
/// A description for ProductDetailPage
/// {@endtemplate}
class ProductDetailPage extends StatefulWidget {
  /// {@macro product_detail_page}
  const ProductDetailPage({
    required this.item,
    super.key,
  });

  final ItemModel item;

  /// The static route for ProductDetailPage
  static Route<dynamic> route(ItemModel item) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ProductDetailPage(item: item),
    );
  }

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    if (getIt.isRegistered<ItemModel>()) {
      getIt.unregister<ItemModel>();
    }
    getIt.registerSingleton(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detalhes do Produto',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
            const GutterTiny(),
          ],
        ),
        body: const ProductDetailView(),
      ),
    );
  }
}

/// {@template product_detail_view}
/// Displays the Body of ProductDetailView
/// {@endtemplate}
class ProductDetailView extends StatelessWidget {
  /// {@macro product_detail_view}
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductDetailBody();
  }
}
