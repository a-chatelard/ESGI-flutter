import 'package:esgiflutter/app/screen/dashboard/dashboard_screen.dart';
import 'package:esgiflutter/app/screen/login/login_screen.dart';
import 'package:esgiflutter/app/screen/register/register_screen.dart';
import 'package:flutter/material.dart';

const loginRoute = '/login';
const registerRoute = 'register';
const dashboardRoute = '/dash';

Map<String, WidgetBuilder> routes = {
  loginRoute: (context) => const LoginScreen(),
  registerRoute: (context) => const RegisterScreen(),
  dashboardRoute: (context) => const DashboardScreen()
};
