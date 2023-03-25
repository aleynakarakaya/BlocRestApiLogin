import 'package:bloc_task/pages/login_page.dart';
import 'package:bloc_task/services/login_info_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.grey,
              )),
      home: RepositoryProvider(
          create: (context) => LoginInfoService(), //connected with login repo
          child: const LoginPage()),
    );
  }
}
