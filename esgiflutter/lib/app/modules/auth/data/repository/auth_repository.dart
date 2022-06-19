import 'package:esgiflutter/app/modules/auth/data/providers/firebase_auth_provider.dart';

class AuthRepository {
  final FirebaseAuthProvider _firebaseAuth = FirebaseAuthProvider();

  login(String email, String password) async {
    await _firebaseAuth.signIn(email, password);
  }

  register({required String email, required String password}) async {
    await _firebaseAuth.signUp(email: email, password: password);
  }

  disconnect() async {
    await _firebaseAuth.signOut();
  }
}