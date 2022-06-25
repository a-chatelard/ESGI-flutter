import 'package:esgiflutter/app/screen/dashboard/dashboard_screen.dart';
import 'package:esgiflutter/app/screen/login/login_screen.dart';
import 'package:esgiflutter/app/screen/note-detail/note_detail_screen.dart';
import 'package:esgiflutter/app/screen/register/register_screen.dart';
import 'package:esgiflutter/app/screen/splash-screen/splash_screen.dart';
import 'package:flutter/material.dart';

const splashScreen = '/splash';
const loginRoute = '/login';
const registerRoute = 'register';
const dashboardRoute = '/dash';
const addNoteRoute = '/new-note';

Map<String, WidgetBuilder> routes = {
  splashScreen: (context) => SplashScreen(),
  loginRoute: (context) => const LoginScreen(),
  registerRoute: (context) => const RegisterScreen(),
  dashboardRoute: (context) => const DashboardScreen(),
  addNoteRoute: (context) => const NoteDetailScreen()
};
