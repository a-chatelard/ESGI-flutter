import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:esgiflutter/app/screen/create_note/widgets/create_note_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacementNamed(context, loginRoute);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.newNote),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 2.h, left: 4.h, right: 4.h),
            child: SingleChildScrollView(child: CreateNoteForm()),
          )),
    );
  }
}
