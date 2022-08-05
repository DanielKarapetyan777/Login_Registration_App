import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/data/bloc/register_bloc.dart';
import 'package:login_register_app/ui/widgets/regist_widgets.dart';

class RegistInputFields extends StatelessWidget {
  const RegistInputFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerFirstName = TextEditingController();
    TextEditingController controllerLastName = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    TextEditingController controllerConfirmPassword = TextEditingController();
    TextEditingController controllerPhonenumber = TextEditingController();

    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterInitial) {
          return RegisterTextFildsValidation(
              controllerFirstName: controllerFirstName,
              controllerLastName: controllerLastName,
              controllerEmail: controllerEmail,
              controllerPhonenumber: controllerPhonenumber,
              controllerPassword: controllerPassword,
              controllerConfirmPassword: controllerConfirmPassword);
        }

        if (state is RegisterLoading) {
          return const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

