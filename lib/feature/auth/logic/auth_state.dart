part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoginSuccess extends AuthState {}
final class AuthLoginLoading extends AuthState {}
final class AuthLoginFailed extends AuthState {
  final String message;
  AuthLoginFailed(this.message);
}
final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFailed extends AuthState {
  final String message;

  AuthRegisterFailed(this.message);
}