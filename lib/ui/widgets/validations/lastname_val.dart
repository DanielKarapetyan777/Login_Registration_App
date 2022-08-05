import 'package:flutter/material.dart';

class LastNameValidation extends StatelessWidget {
  const LastNameValidation({
    Key? key,
    required this.controllerLastName,
  }) : super(key: key);

  final TextEditingController controllerLastName;

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
        controller: controllerLastName,
        textCapitalization: TextCapitalization.sentences,
        onChanged: (String value) {},
        decoration: InputDecoration(
          hintText: 'Last Name',
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
          } else if (value.isEmpty ||
              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return "Enter correct lastName";
          } else {
            return null;
          }
        },
      ),
    );
  }
}