import 'package:esgiflutter/app/screen/login/widgets/login_form.dart';
import 'package:esgiflutter/app/screen/reset-password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.signIn)),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            LoginForm(),
            ResetPasswordScreen()
          ],
        ),
      ),
    );
  }
}
