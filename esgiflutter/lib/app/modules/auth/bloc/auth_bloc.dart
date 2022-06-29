import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_event.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_state.dart';
import 'package:esgiflutter/app/modules/auth/data/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = AuthRepository();

  AuthBloc() : super(UnAuthenticated()) {
    
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.login(event.email, event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.register(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.disconnect();
      emit(UnAuthenticated());
    });

    on<ResetPasswordRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.resetPassword(email: event.email);
        emit(ResetPasswordMailSent());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
