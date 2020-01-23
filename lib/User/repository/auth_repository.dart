import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthAPI();
  //SignIn Google
  Future<FirebaseUser> signInFirebaseGoogle() => _firebaseAuthAPI.signInGoogle();

  //Sign Up User and Password
/*  Future<FirebaseUser>signInWithUserAndPassword(String email, String password) => _firebaseAuthAPI.signUp(email, password); */
 
  //Sign Up User and Password http
 Future signUpHttp(String email, String password)async{
   await _firebaseAuthAPI.nuevoUsuario(email, password);
 }


//SignOut
signOut ()=> _firebaseAuthAPI.signOut();

}