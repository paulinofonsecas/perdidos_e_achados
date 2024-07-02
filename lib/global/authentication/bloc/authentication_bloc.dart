import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestao_restaurante/dados/entidades/local_user.dart';
import 'package:gestao_restaurante/dados/entidades/local_user_credential.dart';
import 'package:gestao_restaurante/dados/servicos/login_firebase.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    _loginFirebase = LoginFirebase.instance;

    on<VerifyCurrentUser>(_onVerifyCurrentUser);
    on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
  }

  late final LoginFirebase _loginFirebase;

  Future<LocalUser?> _verifyCurrentUser() async {
    final i = await SharedPreferences.getInstance();

    if (i.containsKey('user')) {
      final user = LocalUser.fromJson(i.getString('user')!);
      return user;
    } else {
      return null;
    }
  }

  FutureOr<void> _onVerifyCurrentUser(
    VerifyCurrentUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(AuthenticationLoading());

      final user = await _verifyCurrentUser();

      if (user != null) {
        emit(AuthenticationSuccess(user: user));
      } else {
        emit(AuthenticationInitial());
      }
    } catch (e) {
      emit(AuthenticationInitial());
    }
  }

  FutureOr<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final email = event.email;
    final password = event.password;

    await _loginFirebase.login(email, password).then((user) async {
      if (user != null) {
        await _storeUser(user);
        emit(AuthenticationSignInSuccess(user: user));
        return;
      } else {
        emit(const AuthenticationSignInError('Erro ao realizar login'));
      }
    }).onError((e, stack) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-credential') {
          emit(const AuthenticationSignInError('Credenciais inválidas'));
        }

        if (e.code == 'user-disabled') {
          emit(const AuthenticationSignInError('Usuário desabilitado'));
        }

        if (e.code == 'user-not-found') {
          emit(const AuthenticationSignInError('Usuário não encontrado'));
        }

        return;
      }
    });
  }

  Future<void> _storeUser(LocalUser user) async {
    getIt.registerSingleton<LocalUser>(user);

    final i = await SharedPreferences.getInstance();
    await i.setString('user', user.toJson());
  }

  FutureOr<void> _onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final nome = event.nome;
    final email = event.email;
    final password = event.password;
    final role = event.role;

    await _loginFirebase
        .register(
      LocalUserCredential.make(
        nome: nome,
        email: email,
        password: password,
        role: role,
      ),
    )
        .then((user) {
      if (user != null) {
        emit(AuthenticationSignUpSuccess(user: user));
      } else {
        print('Stack 1');
        emit(const AuthenticationSignUpError('Erro ao criar a conta'));
      }
    }).onError((e, stack) {
      print('Stack 2');
      emit(const AuthenticationSignUpError('Erro ao criar a conta'));
    });
  }
}
