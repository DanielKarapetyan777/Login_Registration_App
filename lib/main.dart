import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/data/bloc/login_bloc.dart';
import 'package:login_register_app/data/bloc/register_bloc.dart';
import 'package:login_register_app/ui/pages/login_page.dart';
import 'package:login_register_app/ui/pages/regist_page.dart';
import 'package:login_register_app/ui/pages/user_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var firstname = preferences.getString('firstname');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstname == null
          ? const MyApp()
          : UserPage(ferstname: '', lastname: ''),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Task',
        theme: ThemeData(
          backgroundColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/details': (context) => const RegistPage(),
          '/details1': (context) => UserPage(
                ferstname: '',
                lastname: '',
              )
        },
      ),
    );
  }
}
