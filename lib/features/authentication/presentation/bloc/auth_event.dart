part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];


}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

// Other events like SignupEvent can be defined similarly
class SignupEvent extends AuthEvent {
  final String email;
  final String password;

  const SignupEvent({required this.email, required this.password});
}
