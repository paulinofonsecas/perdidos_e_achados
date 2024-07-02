import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_restaurante/dados/entidades/encomenda.dart';

abstract class IEncomendaFirebase {
  Future<List<EncomendaModel>> getEncomendas();
  Future<EncomendaModel> getEncomenda(String id);
  Future<EncomendaModel> addEncomenda(EncomendaModel encomenda);
  Future<EncomendaModel> updateEncomenda(EncomendaModel encomenda);
  Future<void> deleteEncomenda(String id);
}

class EncomendaFirebase implements IEncomendaFirebase {
  EncomendaFirebase._();
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  static final instance = EncomendaFirebase._();

  @override
  Future<EncomendaModel> addEncomenda(EncomendaModel encomenda) async {
    try {
      await db
          .collection('encomendas')
          .doc(encomenda.id)
          .set(encomenda.toMap());

      return Future.value(encomenda);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> deleteEncomenda(String id) {
    // TODO: implement deleteEncomenda
    throw UnimplementedError();
  }

  @override
  Future<EncomendaModel> getEncomenda(String id) {
    // TODO: implement getEncomenda
    throw UnimplementedError();
  }

  @override
  Future<List<EncomendaModel>> getEncomendas() async {
    try {
      return await db.collection('encomendas').get().then((value) {
        return value.docs.map((e) => EncomendaModel.fromMap(e.data())).toList();
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<EncomendaModel> updateEncomenda(EncomendaModel encomenda) {
    // TODO: implement updateEncomenda
    throw UnimplementedError();
  }
}
