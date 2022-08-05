part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  final User user;
  final BuildContext context;

  const RegisterUser({required this.user,required this.context});

  @override
  List<Object> get props => [user];
}
