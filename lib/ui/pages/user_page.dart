// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/data/bloc/login_bloc.dart';
import 'package:login_register_app/ui/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key, required this.ferstname, required this.lastname})
      : super(key: key);
  String ferstname;
  String lastname;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future getFirstName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.ferstname = preferences.getString('firstname')!;
    });
  }

  Future getLaetName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.lastname = preferences.getString('lastename')!;
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('firstname');

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: const LoginPage(),
                ))));
  }

  @override
  void initState() {
    super.initState();
    getFirstName();
    getLaetName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 82,
        centerTitle: true,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 50,
            width: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: TextButton(
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Color.fromRGBO(59, 158, 146, 1),
                ),
              ),
              onPressed: () {
                logOut(context);
              },
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            child: Text(
              'Welcome ${widget.ferstname} ${widget.lastname}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(59, 158, 146, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
