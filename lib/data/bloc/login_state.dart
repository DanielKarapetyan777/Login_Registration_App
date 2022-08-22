// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  List<User> user;
  bool isUsername = true;
  bool isPassword = true;

  LoginInitial({this.user = const <User>[],required this.isUsername,required this.isPassword});

  @override
  List<Object> get props => [user];
}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginError extends LoginState {}
