import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:login_register_app/data/database.dart';
import 'package:login_register_app/ui/pages/user_page.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial(isPassword: true, isUsername: true)) {
    on<LoginUser>((event, emit) async {
      final state = this.state;
      if (state is LoginInitial) {
        emit(
          LoginLoading(),
        );
        for (User user in users) {
          if (user.email == event.username) {
            if (user.password == event.password) {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setString(
                'firstname',
                user.firstname.toString(),
              );

              SharedPreferences preferences1 =
                  await SharedPreferences.getInstance();
              preferences1.setString(
                'lastename',
                user.lastname.toString(),
              );

              Navigator.push(
                  event.context,
                  MaterialPageRoute(
                      builder: ((context) => UserPage(
                          ferstname: user.firstname.toString(),
                          lastname: user.lastname.toString()))));
            } else {
              state.isPassword = false;
              state.isUsername = true;
              emit(LoginInitial(
                  isUsername: state.isUsername, isPassword: state.isPassword));
            }
          } else {
            state.isUsername = false;
            state.isPassword = true;
            log('ok');
            emit(LoginInitial(
                isUsername: state.isUsername, isPassword: state.isPassword));
          }
        }
      }

      //log(event.username);
    });
  }
}
