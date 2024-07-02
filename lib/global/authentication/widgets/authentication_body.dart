import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/dados/entidades/local_user.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/gestao_produtos.dart';
import 'package:gestao_restaurante/features/client/home_page/view/home_page_page.dart';
import 'package:gestao_restaurante/global/authentication/bloc/authentication_bloc.dart';
import 'package:gestao_restaurante/global/authentication/widgets/login_form_widget.dart';
import 'package:gestao_restaurante/global/global_logo_widget.dart';

class AuthenticationBody extends StatelessWidget {
  /// {@macro authentication_body}
  const AuthenticationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSignInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is AuthenticationSignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: _buildAuthForms(context),
    );
  }

  SafeArea _buildAuthForms(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gutter(),
            const GlobalLogoWidget(),
            const Gutter(),
            Text(
              'Bem-vindo',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const GutterLarge(),
            const AuthFormWidget(),
            const Gutter(),
          ],
        ),
      ),
    );
  }
}
