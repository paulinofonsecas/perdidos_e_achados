import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:uuid/uuid.dart';

abstract class IProdutoFirebase {
  Future<List<ItemModel>> getItems({CategoriaModel? categoria});
  Future<ItemModel?> getItem(String id);
  Future<ItemModel> addItem(ItemModel produto);
  Future<ItemModel> updateProduto(ItemModel produto);
  Future<void> deleteItem(String id);
}

class ItemFirebase implements IProdutoFirebase {
  factory ItemFirebase.test([FirebaseFirestore? db, FirebaseStorage? storage]) {
    return ItemFirebase._(
      db: db,
      storage: storage,
    );
  }

  ItemFirebase._({FirebaseFirestore? db, FirebaseStorage? storage}) {
    this.db = db ?? FirebaseFirestore.instance;
    this.storage = storage ?? FirebaseStorage.instance;
  }

  static final instance = ItemFirebase._();

  late final FirebaseFirestore db;
  late final FirebaseStorage storage;
  List<ItemModel> itemsCache = [];
  final String collection = 'items';

  Future<List<String>?> _saveImages(ItemModel model) async {
    final resultUrls = <String>[];

    if (model.imagemUrl.isNotEmpty) {
      if (model.imagemUrl.first.contains('https')) {
        return model.imagemUrl;
      }

      for (final url in model.imagemUrl) {
        final ref = storage.ref('item_imagens').child(const Uuid().v4());
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
  Future<ItemModel> addItem(ItemModel item) async {
    try {
      final imagemUrls = await _saveImages(item);
      final model = item.copyWith(imagesUrl: imagemUrls ?? []);

      await db.collection(collection).doc(model.id).set(model.toMap());
      return item;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteItem(String id) async {
    try {
      await db.collection(collection).doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ItemModel?> getItem(String id) async {
    try {
      final snapshot = await db.collection(collection).doc(id).get();

      return Future.value(ItemModel.fromMap(snapshot.data()!));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<ItemModel>> getItems({
    CategoriaModel? categoria,
    bool cache = true,
  }) async {
    if (itemsCache.isNotEmpty && cache) {
      return itemsCache;
    }

    try {
      var saida = <ItemModel>[];

      final iterables = (await db.collection(collection).orderBy('nome').get())
          .docs
          .map((e) => e.data())
          .toList();
      final items = iterables.map(ItemModel.fromMap).toList();

      if (categoria != null) {
        saida = items.where((e) {
          return e.categoria.id == categoria.id;
        }).toList();
      } else {
        saida = items;
      }

      itemsCache = saida;
      return saida;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<ItemModel> updateProduto(ItemModel item) async {
    try {
      await db.collection(collection).doc(item.id).update(item.toMap());
      return Future.value(item);
    } catch (e) {
      return Future.error(e);
    }
  }
}
