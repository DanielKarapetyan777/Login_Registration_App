// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? confirmpassword;
  String? phonenumber;
  bool? isLogin;

  User({
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.confirmpassword,
    this.phonenumber,
    this.isLogin,
  }) {
    isLogin = isLogin ?? false;
  }

  User copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    String? confirmpassword,
    String? phonenumber,
    bool? isLogin,
  }) {
    return User(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
      phonenumber: phonenumber ?? this.phonenumber,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        email,
        password,
        confirmpassword,
        phonenumber,
        isLogin,
      ];

  void add(User user) {}
}
