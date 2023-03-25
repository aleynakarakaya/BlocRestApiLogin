import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login/login_bloc.dart';
import '../../blocs/login/login_event.dart';
import '../../blocs/login/login_state.dart';
import '../../exceptions/form_submission_status.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.formKey}) : super(key: key);

  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: ((context, state) {
      return state.formStatus is FormSubmitting
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.all(15.0),
              height: 50.0,
              width: 300,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.purple, Colors.red]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  )),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(0, 255, 255, 255),
                ),
                child: const Text('Log In'),
              ),
            );
    }));
  }
}
