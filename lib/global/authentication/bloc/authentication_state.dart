part of 'authentication_bloc.dart';

/// {@template authentication_state}
/// AuthenticationState description
/// {@endtemplate}
class AuthenticationState extends Equatable {
  /// {@macro authentication_state}
  const AuthenticationState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AuthenticationState with property changes
  AuthenticationState copyWith({
    String? customProperty,
  }) {
    return AuthenticationState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSignInSuccess extends AuthenticationState {
  const AuthenticationSignInSuccess({required this.user});
  final LocalUser user;

  @override
  List<Object> get props => [user];
}

class AuthenticationSignInError extends AuthenticationState {
  const AuthenticationSignInError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class AuthenticationSignUpSuccess extends AuthenticationState {
  const AuthenticationSignUpSuccess({required this.user});
  final LocalUser user;

  @override
  List<Object> get props => [user];
}

class AuthenticationSignUpError extends AuthenticationState {
  const AuthenticationSignUpError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
