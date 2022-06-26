import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_event.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_state.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthBloc authBloc = locator<AuthBloc>();
  final NoteBloc noteBloc = locator<NoteBloc>();

  void _createAccountWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      authBloc.add(
          SignUpRequested(_emailController.text, _passwordController.text));
    }
  }

  void _loadNotes() {
    noteBloc.add(GetAllNotesEvent());
  }     

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          _loadNotes();   
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
              'assets/svg/sign-up.svg',
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
                  labelText: AppLocalizations.of(context)!.password),
              controller: _passwordController,
            ),
            SizedBox(height: 3.h),
            ElevatedButton(
                onPressed: () {               
                  _createAccountWithEmailAndPassword(context);
                },
                child: Text(AppLocalizations.of(context)!.confirm)),
            SizedBox(height: 3.h),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, loginRoute);
                },
                child: Text(AppLocalizations.of(context)!.haveAccount))
          ],
        ),
      ),
    );
  }
}
