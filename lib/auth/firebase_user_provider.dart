import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WazirXCurrentFirebaseUser {
  WazirXCurrentFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

WazirXCurrentFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WazirXCurrentFirebaseUser> wazirXCurrentFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WazirXCurrentFirebaseUser>(
            (user) => currentUser = WazirXCurrentFirebaseUser(user));
