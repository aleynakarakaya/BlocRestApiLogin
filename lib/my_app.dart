import 'package:bloc_task/blocs/auth_bloc/auth_bloc.dart';
import 'package:bloc_task/pages/login_page.dart';
import 'package:bloc_task/repository/repo_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(AuthRepo())),
      ],
      child: MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.grey,
              )),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(AuthRepo())),
        ],
        child: MaterialApp(
          home: LoginPage(),
        ),
      ),
    );
  }
}*/