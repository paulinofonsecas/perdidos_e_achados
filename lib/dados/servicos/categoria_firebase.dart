import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';

abstract class ICategoriaFirebase {
  Future<List<CategoriaModel>> getCategorias();
  Future<CategoriaModel> getCategoria(String id);
  Future<CategoriaModel> addCategoria(CategoriaModel categoria);
  Future<CategoriaModel> updateCategoria(CategoriaModel categoria);
  Future<void> deleteCategoria(String id);
}

class CategoriaFirebase implements ICategoriaFirebase {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final _collection = 'categorias';
  List<CategoriaModel> categoriasCache = [];

  @override
  Future<CategoriaModel> addCategoria(CategoriaModel categoria) async {
    try {
      await db.collection(_collection).add(categoria.toMap());
      return Future.value(categoria);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> deleteCategoria(String id) async {
    try {
      await db.collection(_collection).doc(id).delete();
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<CategoriaModel> getCategoria(String id) async {
    try {
      final snapshot = await db.collection(_collection).doc(id).get();
      return Future.value(CategoriaModel.fromMap(snapshot.data()!));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<CategoriaModel>> getCategorias({bool cache = true}) async {
    if (categoriasCache.isNotEmpty && cache) {
      return Future.value(categoriasCache);
    }

    try {
      final snapshot = await db.collection(_collection).get();
      final list = snapshot.docs
          .map((doc) => CategoriaModel.fromMap(doc.data()))
          .toList();

      categoriasCache = list;

      return list;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<CategoriaModel> updateCategoria(CategoriaModel categoria) async {
    try {
      await db
          .collection(_collection)
          .doc(categoria.id)
          .update(categoria.toMap());
      return Future.value(categoria);
    } catch (e) {
      return Future.error(e);
    }
  }
}
