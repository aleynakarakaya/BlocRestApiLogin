import 'package:bloc_task/pages/widgets/custom_button.dart';
import 'package:bloc_task/pages/widgets/custom_text_field.dart';
import 'package:bloc_task/pages/widgets/divider_widget.dart';
import 'package:bloc_task/pages/widgets/social_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/text_style.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_event.dart';
import '../blocs/auth_bloc/auth_state.dart';
import '../config/color_constants.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc? _authBloc;

  final TextEditingController email =
      TextEditingController(text: "demo@clickia.tv");
  final TextEditingController password =
      TextEditingController(text: "demo1234");

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Image(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.33),
                  const Text(
                    "Hello Again!",
                    style: CustomTextStyle.boldText,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Welcome back you've been missed!",
                      style: CustomTextStyle.thinText,
                    ),
                  ),
                  Container(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: CustomTextField(
                              controller: email,
                              obscure: false,
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: CustomTextField(
                              controller: password,
                              obscure: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 200),
                    child: Text(
                      "Recovery password",
                      style: CustomTextStyle.thinText,
                    ),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      } else if (state is AuthSuccessful) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Welcome',
                            style: CustomTextStyle.boldText,
                          ),
                        ));
                      } else if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Error',
                              style: CustomTextStyle.thinText,
                            ),
                          ),
                        );
                      }
                    },
                    child: CustomButton(
                      onPressed: () {
                        _authBloc!.add(LoginEvent(
                            email: email.text, password: password.text));
                      },
                      text: "Log In",
                    ),
                  ),
                  const DividerWidget(),
                  const SocialRowWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
