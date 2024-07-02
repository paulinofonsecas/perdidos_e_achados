import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/local_user.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/view/gestao_produtos_page.dart';
import 'package:gestao_restaurante/features/client/home_page/view/home_page_page.dart';
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

  void onAuthSuccess(BuildContext context, dynamic state) {
    if (getIt.isRegistered<LocalUser>()) {
      getIt.unregister<LocalUser>();
    }

    // ignore: avoid_dynamic_calls
    getIt.registerSingleton<LocalUser>(state.user as LocalUser);

    // ignore: avoid_dynamic_calls
    if (state.user.role == 'admin') {
      Navigator.of(context).pushReplacement(GestaoProdutosPage.route());
    } else {
      Navigator.of(context).pushReplacement(HomePagePage.route());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: context.read<AuthenticationBloc>()..add(const VerifyCurrentUser()),
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          onAuthSuccess(context, state);
        }
        if (state is AuthenticationSignInSuccess) {
          onAuthSuccess(context, state);
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return const AuthenticationBody();
      },
    );
  }
}
