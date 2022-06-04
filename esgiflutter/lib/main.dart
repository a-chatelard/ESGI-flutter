import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app_routes.dart';
import 'app/config/config.dart';
import 'app/config/firebase_options.dart';
import 'package:sizer/sizer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

initializeFirebase() async {
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    //login();
    super.initState();
  }

  // Exemple d'implémentation brute de l'authentification.
  // TODO À améliorer avec le pattern BLOC.
/*  login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: "chatelardantoine@gmail.com", password: "Yolo1234");
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("user not found"); 
      } else if (e.code == 'wrong-password') {
        print("wrong password");
      } else {
        print(e.message);
      }
    }
  }*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: theme,
              initialRoute: loginRoute,
              routes: routes
          );
        }
    );

  }
}


