import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as u;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  dynamic _userFromFirebaseUser(var user) {
    return user != null ? u.User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<u.User?> get user {
    return _auth
        .authStateChanges()
        .map((event) => _userFromFirebaseUser(event));
  }

  //sign in anonymously
  Future signInAnonymous() async {
    try {
      final authResult = await _auth.signInAnonymously();
      final user = authResult.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password
  Future registerWithEmailPassword(String email, String password) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = authResult.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //signout
  Future signingOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
