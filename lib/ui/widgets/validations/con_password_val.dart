import 'package:flutter/material.dart';

class ConPasswordValidation extends StatelessWidget {
  const ConPasswordValidation({
    Key? key,
    required this.controllerConfirmPassword,
    required this.controllerPassword,
  }) : super(key: key);

  final TextEditingController controllerConfirmPassword;
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
        controller: controllerConfirmPassword,
        obscureText: true,
        obscuringCharacter: "*",
        autocorrect: false,
        enableSuggestions: false,
        onChanged: (String value) {},
        decoration: InputDecoration(
          hintText: 'Confirm Password',
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
          } else if (controllerPassword.value.text !=
              controllerConfirmPassword.value.text) {
            controllerConfirmPassword.clear();
            return 'Repeat password';
          } else {
            return null;
          }
        },
      ),
    );
  }
}