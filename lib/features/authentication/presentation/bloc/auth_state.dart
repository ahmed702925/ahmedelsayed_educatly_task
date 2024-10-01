part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}
