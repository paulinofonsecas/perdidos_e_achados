import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:uuid/uuid.dart';

abstract class IProdutoFirebase {
  Future<List<ProdutoModel>> getProdutos({CategoriaModel? categoria});
  Future<ProdutoModel> getProduto(String id);
  Future<ProdutoModel> addProduto(ProdutoModel produto);
  Future<ProdutoModel> updateProduto(ProdutoModel produto);
  Future<void> deleteProduto(String id);
}

class ProdutoFirebase implements IProdutoFirebase {
  ProdutoFirebase._();
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  List<ProdutoModel> produtosCache = [];

  static final instance = ProdutoFirebase._();

  Future<List<String>?> _saveImages(ProdutoModel model) async {
    final resultUrls = <String>[];

    if (model.imagemUrl.isNotEmpty) {
      if (model.imagemUrl.first.contains('https')) {
        return model.imagemUrl;
      }

      for (final url in model.imagemUrl) {
        final ref = storage.ref('produto_imagens').child(const Uuid().v4());
        await ref.putFile(File(url)).then((value) async {
          resultUrls.add(await value.ref.getDownloadURL());
        });
      }

      return resultUrls;
    } else {
      return null;
    }
  }

  @override
  Future<ProdutoModel> addProduto(ProdutoModel produto) async {
    try {
      final imagemUrls = await _saveImages(produto);
      final model = produto.copyWith(imagemUrl: imagemUrls ?? []);

      await db.collection('produtos').add(model.toMap());
      return produto;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduto(String id) async {
    try {
      await db.collection('produtos').doc(id).delete();
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<ProdutoModel> getProduto(String id) async {
    try {
      final snapshot = await db.collection('produtos').doc(id).get();
      return Future.value(ProdutoModel.fromMap(snapshot.data()!));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<ProdutoModel>> getProdutos({
    CategoriaModel? categoria,
    bool cache = true,
  }) async {
    if (produtosCache.isNotEmpty && cache) {
      return produtosCache;
    }

    try {
      var saida = <ProdutoModel>[];

      final iterables = (await db.collection('produtos').orderBy('nome').get())
          .docs
          .map((e) => e.data())
          .toList();
      final produtos = iterables.map(ProdutoModel.fromMap).toList();

      if (categoria != null) {
        saida = produtos.where((e) {
          return e.categoria.id == categoria.id;
        }).toList();
      } else {
        saida = produtos;
      }

      produtosCache = saida;
      return saida;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<ProdutoModel> updateProduto(ProdutoModel produto) async {
    try {
      await db.collection('produtos').doc(produto.id).update(produto.toMap());
      return Future.value(produto);
    } catch (e) {
      return Future.error(e);
    }
  }
}
