import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/src/feature/auth/login/login_event.dart';
import 'package:flutter_bloc_login/src/feature/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));
    on<PasswordChanged>(
        (event, emit) => emit(state.copyWith(email: event.password)));
    on<LoginClicked>((event, emit) => emit(state));
  }
}
