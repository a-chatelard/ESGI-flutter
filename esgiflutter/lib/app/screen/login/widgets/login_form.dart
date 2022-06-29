import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:esgiflutter/app/modules/forms/bloc/form_bloc.dart';
import 'package:esgiflutter/app/modules/forms/validation/field_error.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthBloc authBloc = locator<AuthBloc>();
  final NoteBloc noteBloc = locator<NoteBloc>();
  final FormBloc formBloc = locator<FormBloc>();

  _loadNotes() {
    noteBloc.add(GetAllNotesEvent());
  }

  _signIn() {
    authBloc
        .add(SignInRequested(_emailController.text, _passwordController.text));
  }

  _validateForm() {
    formBloc.add(LoginFormSubmittedEvent(
        _emailController.text, _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          if (state is Authenticated) {
            _loadNotes();
            Navigator.pushReplacementNamed(context, dashboardRoute);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        }),
        BlocListener<FormBloc, AppFormState>(listener: (context, state) {
          if (state is ValidFormState) {
            _signIn();
          }
        })
      ],
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
            SizedBox(height: 7.h),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Email', suffixIcon: Icon(Icons.email_outlined)),
              controller: _emailController,
            ),
            BlocBuilder<FormBloc, AppFormState>(builder: ((context, state) {
              if (state is InvalidFormState) {
                if (state.fieldsError.containsKey("email")) {
                  if (state.fieldsError["email"] == FieldError.badEmailFormat) {
                    return Text("Format email invalid");
                  } else if (state.fieldsError["email"] == FieldError.empty) {
                    return Text("Ce champ ne peut pas être vide.");
                  }
                }
              }
              return const Text("");
            })),
            SizedBox(height: 1.h),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.password,
                  suffixIcon: const Icon(Icons.lock_outline)),
              controller: _passwordController,
              obscureText: true,
            ),
            BlocBuilder<FormBloc, AppFormState>(builder: ((context, state) {
              if (state is InvalidFormState) {
                if (state.fieldsError.containsKey("password")) {
                  if (state.fieldsError["password"] == FieldError.empty) {
                    return Text("Ce champ ne peut pas être vide.");
                  }
                }
              }
              return const Text("");
            })),
            SizedBox(height: 2.h),
            ElevatedButton(
                onPressed: _validateForm,
                child: Text(AppLocalizations.of(context)!.signIn)),
            SizedBox(height: 2.h),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, registerRoute);
                },
                child: Text(AppLocalizations.of(context)!.noAccount)),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, resetPasswordRoute);
                },
                child: Text(AppLocalizations.of(context)!.forgotPassword))
          ],
        ),
      ),
    );
  }
}
