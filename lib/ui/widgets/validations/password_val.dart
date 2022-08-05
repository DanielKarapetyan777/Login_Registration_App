import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    Key? key,
    required this.controllerPassword,
  }) : super(key: key);

  final TextEditingController controllerPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: controllerPassword,
        obscureText: true,
        obscuringCharacter: "*",
        autocorrect: false,
        enableSuggestions: false,
        onChanged: (String value) {},
        decoration: InputDecoration(
          hintText: 'Password',
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Fill in the field';
          } else if (value.isEmpty) {
            return "Enter correct password";
          } else if (value.length < 8) {
            return 'password meat be at least 8 character long';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
