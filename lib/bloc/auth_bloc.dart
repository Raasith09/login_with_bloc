import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
//Auth Requested

    on<AuthLoginRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          if (event.password.isEmpty || event.email.isEmpty) {
            return emit(AuthFailure("Please enter a valid details"));
          }

          if (event.password.length < 8) {
            return emit(AuthFailure("Password should be at least 8 character"));
          }

          await Future.delayed(const Duration(seconds: 1), () {
            emit(AuthSuccess(uid: "${event.email}&${event.password}"));
          });
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      },
    );

    on<AuthLogoutRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          await Future.delayed(const Duration(seconds: 2), () {
            return emit(AuthInitial());
          });
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      },
    );
  }
}
