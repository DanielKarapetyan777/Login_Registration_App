part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String username;
  final String password;
  final BuildContext context;

  const LoginUser( {required this.username, required this.password,required this.context,});

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
