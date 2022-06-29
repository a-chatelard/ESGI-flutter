import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:esgiflutter/app/modules/forms/bloc/form_bloc.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:esgiflutter/app/screen/dashboard/dashboard_screen.dart';
import 'package:esgiflutter/app/screen/login/login_screen.dart';
import 'package:esgiflutter/app/screen/splash/splash_screen.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app_routes.dart';
import 'app/config/config.dart';
import 'app/config/firebase_options.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authBloc = locator<AuthBloc>();
  final noteBloc = locator<NoteBloc>();
  final formBloc = locator<FormBloc>();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
            // l10n configuration
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme,
            routes: routes,
            builder: (_, widget) {
              return MultiBlocProvider(providers: [
                BlocProvider<AuthBloc>(create: (_) => authBloc),
                BlocProvider<NoteBloc>(create: (_) => noteBloc),
                BlocProvider<FormBloc>(create: (_) => formBloc)
              ], child: widget ?? Container());
            },
            home: FutureBuilder<User?>(
                future: FirebaseAuth.instance.authStateChanges().first,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return DashboardScreen();
                    }
                    return const LoginScreen();
                  }
                  return const SplashScreen();
                }));
      });
  }
}
