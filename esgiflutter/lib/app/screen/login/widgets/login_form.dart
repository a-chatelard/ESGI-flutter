import 'package:esgiflutter/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../modules/auth/bloc/auth_bloc.dart';
import '../../../modules/auth/bloc/auth_event.dart';
import '../../../modules/auth/bloc/auth_state.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
          SignInRequested(_emailController.text, _passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, dashboardRoute);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/sign-in.svg',
              height: 30.h,
            ),
            SizedBox(height: 10.h),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Email', suffixIcon: Icon(Icons.email_outlined)),
              controller: _emailController,
            ),
            SizedBox(height: 3.h),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.password,
                  suffixIcon: const Icon(Icons.visibility_off)),
              controller: _passwordController,
            ),
            SizedBox(height: 3.h),
            ElevatedButton(
                onPressed: () {
                  _authenticateWithEmailAndPassword(context);
                },
                child: Text(AppLocalizations.of(context)!.signIn)),
            SizedBox(height: 3.h),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, registerRoute);
                },
                child: Text(AppLocalizations.of(context)!.noAccount))
          ],
        ),
      ),
    );
  }
}
