import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/config/config.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({Key? key}) : super(key: key);

  final AuthBloc authBloc = locator<AuthBloc>();

  _signOut(context) {
    authBloc.add(SignOutRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated || state is AuthError) {
          Navigator.pushReplacementNamed(context, loginRoute);
        }
      },
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: blackColor,
              ),
              child: Text(
                'My notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, dashboardRoute);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Edit password'),
              onTap: () {
                Navigator.pushNamed(context, resetPasswordRoute);
              },
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Disconnect'),
                onTap: _signOut(context))
          ],
        ),
      ),
    );
  }
}
