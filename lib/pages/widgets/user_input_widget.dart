import 'package:bloc_task/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login/login_bloc.dart';
import '../../blocs/login/login_event.dart';
import '../../blocs/login/login_state.dart';

class UserInputWidget extends StatelessWidget {
  const UserInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorConstants.darkGray,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: ColorConstants.lightGray)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _usernameTextField(),
            const Divider(
              color: Colors.white,
            ),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "Username",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            validator: (value) =>
                state.isValidUsername ? null : "Username is too short",
            onChanged: (value) => context
                .read<LoginBloc>()
                .add(LoginUsernameChanged(username: value)),
          ),
        );
      }),
    );
  }

  Widget _passwordTextField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            obscureText: true,
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            validator: (value) =>
                state.isValidPassword ? null : "Password is too short",
            onChanged: (value) => context
                .read<LoginBloc>()
                .add(LoginPasswordChanged(password: value)),
          ),
        );
      }),
    );
  }
}
