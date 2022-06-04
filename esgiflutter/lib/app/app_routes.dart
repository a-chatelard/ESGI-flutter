import 'package:esgiflutter/app/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

const loginRoute = '/login';

Map<String, WidgetBuilder> routes = {
  loginRoute: (context) => const LoginScreen()
};