import 'package:esgiflutter/app/screen/create_note/create_note_screen.dart';
import 'package:esgiflutter/app/screen/dashboard/dashboard_screen.dart';
import 'package:esgiflutter/app/screen/login/login_screen.dart';
import 'package:esgiflutter/app/screen/note_details/note_details_screen.dart';
import 'package:esgiflutter/app/screen/register/register_screen.dart';
import 'package:esgiflutter/app/screen/reset-password/reset_password_screen.dart';
import 'package:esgiflutter/app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

const splashScreen = '/splash';
const loginRoute = '/login';
const registerRoute = 'register';
const dashboardRoute = '/dash';
const addNoteRoute = '/new-note';
const notedetailsRoute = '/note-details';
const resetPasswordRoute = '/reset-password';

Map<String, WidgetBuilder> routes = {
  splashScreen: (context) => const SplashScreen(),
  loginRoute: (context) => const LoginScreen(),
  registerRoute: (context) => const RegisterScreen(),
  dashboardRoute: (context) => DashboardScreen(),
  addNoteRoute: (context) => const CreateNoteScreen(),
  notedetailsRoute: (context) => NoteDetailsScreen(),
  resetPasswordRoute: (context) => ResetPasswordScreen()
};
