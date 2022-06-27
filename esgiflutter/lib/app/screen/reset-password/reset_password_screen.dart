import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/locator.dart';
import '../../config/config.dart';
import '../../modules/auth/bloc/auth_event.dart';
import '../../modules/auth/bloc/auth_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final authBloc = locator<AuthBloc>();

  _sendResetPassword(String email) {
    authBloc.add(ResetPasswordRequested(email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: ((context, state) {
        if (state is ResetPasswordMailSent) {
          Navigator.pushReplacementNamed(context, loginRoute);
        }
      }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset password'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(label: Text('Email')),
                ),
                ElevatedButton(
                    onPressed: () {
                      _sendResetPassword(_emailController.text);
                    },
                    child: const Text("Send"))
              ],
            )),
      ),
    );
  }
}
