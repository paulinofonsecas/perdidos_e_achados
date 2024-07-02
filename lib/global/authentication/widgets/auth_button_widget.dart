import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/global/authentication/bloc/authentication_bloc.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    required this.titleAuthButton,
    required this.onTap,
    super.key,
  });

  final String titleAuthButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const CircularProgressIndicator();
          }

          return OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(45),
            ),
            child: Text(titleAuthButton),
          );
        },
      ),
    );
  }
}
