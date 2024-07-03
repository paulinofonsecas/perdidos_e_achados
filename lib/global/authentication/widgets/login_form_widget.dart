import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/local_user.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/gestao_produtos.dart';
import 'package:gestao_restaurante/global/authentication/bloc/authentication_bloc.dart';
import 'package:gestao_restaurante/global/authentication/cubit/email_field_cubit.dart';
import 'package:gestao_restaurante/global/authentication/cubit/nome_field_cubit.dart';
import 'package:gestao_restaurante/global/authentication/cubit/password_field_cubit.dart';
import 'package:gestao_restaurante/global/authentication/widgets/auth_button_widget.dart';
import 'package:gestao_restaurante/global/authentication/widgets/email_field_widget.dart';
import 'package:gestao_restaurante/global/authentication/widgets/nome_field_widget.dart';
import 'package:gestao_restaurante/global/authentication/widgets/password_field_widget.dart';
import 'package:gestao_restaurante/global/authentication/widgets/repeat_password_field_widget.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({
    super.key,
  });

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  bool isLoginForm = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final footerTextInfo =
        isLoginForm ? 'Não possui uma conta?' : 'Já possui uma conta?';

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Conta criada com sucesso!'),
            ),
          );

          setState(() {
            isLoginForm = !isLoginForm;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (!isLoginForm) ...[
                const NomeFieldWidget(),
                const Gutter(),
              ],
              const EmailFieldWidget(),
              const Gutter(),
              const PasswordFieldWidget(),
              const Gutter(),
              if (!isLoginForm) const RepeatPasswordFieldWidget(),
              const Gutter(),
              AuthButtonWidget(
                titleAuthButton: isLoginForm ? 'Entrar' : 'Cadastrar',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (isLoginForm) {
                      context.read<AuthenticationBloc>().add(
                            SignInEvent(
                              email: context
                                  .read<EmailFieldCubit>()
                                  .state
                                  .email
                                  .trim(),
                              password: context
                                  .read<PasswordFieldCubit>()
                                  .state
                                  .password
                                  .trim(),
                            ),
                          );
                    } else {
                      context.read<AuthenticationBloc>().add(
                            SignUpEvent(
                              nome: context
                                  .read<NomeFieldCubit>()
                                  .state
                                  .nome
                                  .trim(),
                              email: context
                                  .read<EmailFieldCubit>()
                                  .state
                                  .email
                                  .trim(),
                              password: context
                                  .read<PasswordFieldCubit>()
                                  .state
                                  .password
                                  .trim(),
                              role: 'user',
                            ),
                          );
                    }
                  }
                },
              ),
              const Gutter(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(footerTextInfo),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoginForm = !isLoginForm;
                      });
                    },
                    child: const Text('Clique aqui!'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
