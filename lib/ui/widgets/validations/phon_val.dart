import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberValidation extends StatelessWidget {
  const PhoneNumberValidation({
    Key? key,
    required this.controllerPhonenumber,
  }) : super(key: key);

  final TextEditingController controllerPhonenumber;

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
      child: IntlPhoneField(
        keyboardType: TextInputType.number,
        controller: controllerPhonenumber,
        decoration: const InputDecoration(
          hintText: 'Phone number',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}