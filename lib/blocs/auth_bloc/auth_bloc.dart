import 'package:bloc_task/blocs/auth_bloc/auth_event.dart';
import 'package:bloc_task/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repo_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      if (result == "true") {
        emit(AuthSuccessful());
      }
      if (result != "true") {
        emit(AuthError("Missing password OR user not found"));
      }
    });
  }
}
