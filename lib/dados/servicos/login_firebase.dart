import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestao_restaurante/dados/entidades/local_user.dart';
import 'package:gestao_restaurante/dados/entidades/local_user_credential.dart';

abstract class ILoginFirebase {
  Future<LocalUser?> login(String email, String password);
  Future<LocalUser?> register(LocalUserCredential userCredentials);
  Future<LocalUser?> getCurrentUser();
  Future<void> logout();
  Future<bool> isLoggedIn();
}

class LoginFirebase implements ILoginFirebase {
  LoginFirebase._();

  static final instance = LoginFirebase._();
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Future<LocalUser?> getCurrentUser() async {
    if (await isLoggedIn()) {
      final user = auth.currentUser!;

      final userResult = await db
          .collection('users')
          .doc(user.uid)
          .get()
          .then((v) => LocalUser.fromMap(v.data()!));

      return userResult;
    } else {
      return null;
    }
  }

  @override
  Future<bool> isLoggedIn() {
    return Future.value(auth.currentUser != null);
  }

  @override
  Future<LocalUser?> login(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userResult = await db
          .collection('users')
          .doc(user.user!.uid)
          .get()
          .then((v) => LocalUser.fromMap(v.data()!));

      return userResult;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> logout() {
    return auth.signOut();
  }

  @override
  Future<LocalUser?> register(LocalUserCredential userCredentials) async {
    try {
      // cria um novo usuário
      final user = await auth.createUserWithEmailAndPassword(
        email: userCredentials.email,
        password: userCredentials.password,
      );

      // valida se o usuário foi criado
      if (user.user == null) throw Exception('Usuário não criado');

      if (userCredentials.nome == null) {
        throw Exception('Nome não pode ser null');
      }

      // cria a instancia do usuário para o firebaseFirestore
      final localUser = LocalUser(
        id: user.user!.uid,
        email: userCredentials.email,
        nome: userCredentials.nome!,
        role: userCredentials.role ?? 'user',
      );

      await db.collection('users').doc(user.user!.uid).set(localUser.toMap());

      return localUser;
    } catch (e) {
      return Future.error(e);
    }
  }
}
