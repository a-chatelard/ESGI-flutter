
import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:esgiflutter/app/modules/forms/bloc/form_bloc.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthBloc>(() => AuthBloc());
  locator.registerLazySingleton<NoteBloc>(() => NoteBloc());
  locator.registerLazySingleton<FormBloc>(() => FormBloc());
}
