import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/servicos/produto_firebase.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}

class FirebaseStorageMock extends Mock implements FirebaseStorage {}

void main() async {
  group('Positive testes', () {
    test('Adiciona um item no banco de dados', () async {
      final instance = FakeFirebaseFirestore();
      final storage = MockFirebaseStorage();

      final itemFirebase = ItemFirebase.test(instance, storage);

      final itemFake = ItemModel(
        id: const Uuid().v4(),
        nome: 'Teste',
        categoria: CategoriaModel(id: '1', descricao: 'Teste'),
        descricao: 'Teste',
        imagemUrl: [],
        dataItemAchado: DateTime.now(),
        dataItemPerdido: DateTime.now(),
        criationDate: DateTime.now(),
        encontrado: true,
        localEncontrado: 'Teste',
        userQuerAchou: 'Teste',
      );

      final result = await itemFirebase.addItem(itemFake);

      expect(result, isA<ItemModel>()); // 1
    });

    test('Altera um item no banco de dados', () async {
      final instance = FakeFirebaseFirestore();
      final storage = MockFirebaseStorage();

      final itemFirebase = ItemFirebase.test(instance, storage);

      final itemFake = ItemModel(
        id: const Uuid().v4(),
        nome: 'Teste',
        categoria: CategoriaModel(id: '1', descricao: 'Teste'),
        descricao: 'Teste',
        imagemUrl: [],
        dataItemAchado: DateTime.now(),
        dataItemPerdido: DateTime.now(),
        encontrado: true,
        localEncontrado: 'Teste',
        userQuerAchou: 'Teste',
      );

      final result = await itemFirebase.addItem(itemFake);
      expect(result, isA<ItemModel>()); // 1

      final result2 = await itemFirebase.getItem(itemFake.id);
      await itemFirebase.updateProduto(result2!.copyWith(nome: 'Teste2'));
      final result4 = await itemFirebase.getItem(itemFake.id);

      expect(result2, isA<ItemModel>()); // 1
      expect(result4!.nome, isA<String>()); // 1
      expect(result4.nome, 'Teste2'); // 1
    });

    test('Recupera um item no banco de dados', () async {
      final instance = FakeFirebaseFirestore();
      final storage = MockFirebaseStorage();

      final itemFirebase = ItemFirebase.test(instance, storage);

      final itemFake = ItemModel(
        id: const Uuid().v4(),
        nome: 'Teste',
        categoria: CategoriaModel(id: '1', descricao: 'Teste'),
        descricao: 'Teste',
        imagemUrl: [],
        dataItemAchado: DateTime.now(),
        dataItemPerdido: DateTime.now(),
        encontrado: true,
        localEncontrado: 'Teste',
        userQuerAchou: 'Teste',
      );

      final result = await itemFirebase.addItem(itemFake);
      expect(result, isA<ItemModel>()); // 1

      final result2 = await itemFirebase.getItem(result.id);
      expect(result2, isA<ItemModel>()); // 1
    });

    test('Recupera os valores do banco de dados', () async {
      final instance = FakeFirebaseFirestore();
      final storage = MockFirebaseStorage();

      final itemFirebase = ItemFirebase.test(instance, storage);

      final itemFake = ItemModel(
        id: const Uuid().v4(),
        nome: 'Teste',
        categoria: CategoriaModel(id: '1', descricao: 'Teste'),
        descricao: 'Teste',
        imagemUrl: [],
        dataItemAchado: DateTime.now(),
        dataItemPerdido: DateTime.now(),
        encontrado: true,
        localEncontrado: 'Teste',
        userQuerAchou: 'Teste',
      );

      await itemFirebase.addItem(itemFake);
      final result = await itemFirebase.getItems();

      expect(result.length, 1); // 1
    });

    test('Deleta um item no banco de dados', () async {
      final instance = FakeFirebaseFirestore();
      final storage = MockFirebaseStorage();

      final itemFirebase = ItemFirebase.test(instance, storage);

      final itemFake = ItemModel(
        id: const Uuid().v4(),
        nome: 'Teste',
        categoria: CategoriaModel(
          id: '1',
          descricao: 'Teste',
        ),
        descricao: 'Teste',
        imagemUrl: [],
        dataItemAchado: DateTime.now(),
        dataItemPerdido: DateTime.now(),
        encontrado: true,
        localEncontrado: 'Teste',
        userQuerAchou: 'Teste',
      );

      final result = await itemFirebase.deleteItem(itemFake.id);

      expect(result, true); // 1
    });
  });
}
