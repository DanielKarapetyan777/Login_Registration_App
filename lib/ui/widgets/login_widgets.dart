// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/data/bloc/login_bloc.dart';

class LoginWidgets extends StatefulWidget {
  const LoginWidgets({
    Key? key,
    required this.isUsername,
    required this.isPassword,
    required this.controllerUsername,
    required this.controllerPassword,
  }) : super(key: key);
  final bool isUsername;
  final bool isPassword;
  final TextEditingController controllerUsername;
  final TextEditingController controllerPassword;

  @override
  State<LoginWidgets> createState() => _LoginWidgetsState();
}

class _LoginWidgetsState extends State<LoginWidgets> {
  final GlobalKey<FormState> formKay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? text;
    String? text1;
    return Form(
      key: formKay,
      child: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 76,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 32, right: 30),
                    height: 48,
                    child: Row(
                      children: [
                        const Text('Don’t have an HyeID account?'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/details', (route) => false);
                          },
                          child: const Text(
                            'CREATE',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(59, 158, 146, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 74,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    width: 311,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.2,
                          blurRadius: 0.5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: widget.controllerUsername,
                      onChanged: (String value) {},
                      decoration: InputDecoration(
                        hintText: 'Username: email',
                        errorText: text1 = widget.isUsername == false
                            ? 'UserName invalid'
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    width: 311,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.2,
                          blurRadius: 0.5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: widget.controllerPassword,
                      obscureText: true,
                      obscuringCharacter: "*",
                      autocorrect: false,
                      enableSuggestions: false,
                      onChanged: (String value) {},
                      decoration: InputDecoration(
                        hintText: 'Password',
                        errorText: text = widget.isPassword == false
                            ? 'password invalid'
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    alignment: Alignment.centerRight,
                    width: 311,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 34),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(311, 48),
                    primary: const Color.fromRGBO(59, 158, 146, 1),
                  ),
                  child: const Text('LOGIN'),
                  onPressed: () {
                    var password = widget.controllerPassword.value.text;
                    var username = widget.controllerUsername.value.text;

                    context.read<LoginBloc>().add(
                          LoginUser(
                            password: password,
                            username: username,
                            context: context,
                          ),
                        );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
