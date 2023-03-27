import 'package:bloc_task/pages/login_page.dart';
import 'package:bloc_task/repository/repo_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth_bloc/auth_bloc.dart';
import 'my_app.dart';

void main() {
  runApp(const MyApp());

  AuthRepo authRepo = AuthRepo();
  authRepo.login("demo@clickia.tv", "demo1234");
}
