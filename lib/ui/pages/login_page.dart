import 'package:flutter/material.dart';
import 'package:login_register_app/ui/widgets/login_input_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 82,
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: const LoginInputFields(),
    );
  }
}