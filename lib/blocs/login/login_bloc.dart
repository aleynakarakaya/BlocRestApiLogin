import 'package:bloc_task/blocs/login/login_state.dart';
import 'package:bloc_task/exceptions/form_submission_status.dart';
import 'package:bloc_task/services/login_info_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginInfoService? loginInfoService;

  LoginBloc(LoginInfoService of,
      {this.loginInfoService, LoginInfoService, LoginInfoActivity})
      : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await loginInfoService?.getLoginInfoActivity();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
