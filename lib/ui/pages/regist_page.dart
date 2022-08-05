import 'package:flutter/material.dart';
import 'package:login_register_app/ui/widgets/regist_input_fields.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 82,
          elevation: 0,
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(6),
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/',
                  );
                },
                iconSize: 20,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: const RegistInputFields());
  }
}
