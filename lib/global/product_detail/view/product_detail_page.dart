// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
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
    required this.produto,
    super.key,
  });

  final ProdutoModel produto;

  /// The static route for ProductDetailPage
  static Route<dynamic> route(ProdutoModel produto) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ProductDetailPage(produto: produto),
    );
  }

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    if (getIt.isRegistered<ProdutoModel>()) {
      getIt.unregister<ProdutoModel>();
    }
    getIt.registerSingleton(widget.produto);
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
