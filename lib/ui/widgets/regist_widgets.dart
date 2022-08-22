import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/data/bloc/register_bloc.dart';
import 'package:login_register_app/data/models/user.dart';
import 'package:login_register_app/ui/widgets/validations/con_password_val.dart';
import 'package:login_register_app/ui/widgets/validations/email_val.dart';
import 'package:login_register_app/ui/widgets/validations/firstname_val.dart';
import 'package:login_register_app/ui/widgets/validations/lastname_val.dart';
import 'package:login_register_app/ui/widgets/validations/password_val.dart';
import 'package:login_register_app/ui/widgets/validations/phon_val.dart';

class RegisterTextFildsValidation extends StatelessWidget {
  RegisterTextFildsValidation({
    Key? key,
    required this.controllerFirstName,
    required this.controllerLastName,
    required this.controllerEmail,
    required this.controllerPhonenumber,
    required this.controllerPassword,
    required this.controllerConfirmPassword,
  }) : super(key: key);

  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPhonenumber;
  final TextEditingController controllerPassword;
  final TextEditingController controllerConfirmPassword;
  final GlobalKey<FormState> formKay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKay,
      child: Stack(
        children: [
          ListView(children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 32, right: 30, top: 16),
                  height: 48,
                  child: Row(
                    children: [
                      const Text('Don’t have an HyeID account?'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/',
                          );
                        },
                        child: const Text(
                          'LOGIN',
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
                  height: 54,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                FirstNameValidation(controllerFirstName: controllerFirstName),
                LastNameValidation(controllerLastName: controllerLastName),
                EmailValidation(controllerEmail: controllerEmail),
                PhoneNumberValidation(
                    controllerPhonenumber: controllerPhonenumber),
                PasswordValidation(controllerPassword: controllerPassword),
                ConPasswordValidation(
                    controllerConfirmPassword: controllerConfirmPassword,
                    controllerPassword: controllerPassword),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 34),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(311, 48),
                  primary: const Color.fromRGBO(59, 158, 146, 1),
                ),
                child: const Text('CREATE'),
                onPressed: () {
                  var user = User(
                    firstname: controllerFirstName.value.text,
                    lastname: controllerLastName.value.text,
                    email: controllerEmail.value.text,
                    password: controllerPassword.value.text,
                    confirmpassword: controllerConfirmPassword.value.text,
                    phonenumber: controllerPhonenumber.value.text,
                  );
                  if (formKay.currentState!.validate()) {
                    context.read<RegisterBloc>().add(
                          RegisterUser(user: user, context: context),
                        );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}


// firstname: controllerFirstName.value.text,
//                     lastname: controllerLastName.value.text,
//                     email: controllerEmail.value.text,
//                     password: controllerPassword.value.text,
//                     confirmpassword: controllerConfirmPassword.value.text,
//                     phonenumber: controllerPhonenumber.value.text,
//                   );