import 'package:flutter/material.dart';
import 'package:gestao_restaurante/global/authentication/bloc/bloc.dart';
import 'package:gestao_restaurante/global/authentication/cubit/email_field_cubit.dart';
import 'package:gestao_restaurante/global/authentication/cubit/nome_field_cubit.dart';
import 'package:gestao_restaurante/global/authentication/cubit/password_field_cubit.dart';
import 'package:gestao_restaurante/global/authentication/widgets/authentication_body.dart';

/// {@template authentication_page}
/// A description for AuthenticationPage
/// {@endtemplate}
class AuthenticationPage extends StatelessWidget {
  /// {@macro authentication_page}
  const AuthenticationPage({super.key});

  /// The static route for AuthenticationPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const AuthenticationPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => NomeFieldCubit(),
        ),
        BlocProvider(
          create: (context) => EmailFieldCubit(),
        ),
        BlocProvider(
          create: (context) => PasswordFieldCubit(),
        ),
      ],
      child: const Scaffold(
        body: AuthenticationView(),
      ),
    );
  }
}

/// {@template authentication_view}
/// Displays the Body of AuthenticationView
/// {@endtemplate}
class AuthenticationView extends StatelessWidget {
  /// {@macro authentication_view}
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticationBody();
  }
}
