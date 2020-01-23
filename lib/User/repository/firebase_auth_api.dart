import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class FirebaseAuthAPI  {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //user


  //Sign In Google
  Future<FirebaseUser> signInGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication gSA =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in with Google es:" + user.email);
    return user;
  }

  //Sign Up User and Password
 /*  Future<FirebaseUser> signUp(String email, String password) async {
    AuthResult user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("signed up with mail and es:" + user.user.email);
    return user.user;
  } */


    //Sign Up User and Password with post
  final String _firebaseToken = 'AIzaSyB69hfiRWrtOMRN9IzM74EDPUXU3hqJmXI';

  Future nuevoUsuario(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'token': true,
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);

    
  }

  //SignOut
  signOut() async {
    await _auth.signOut().then((onValue) => print('Sesión Firebase Cerrada'));
    await googleSignIn
        .signOut()
        .then((onValue) => print('Sesión Google Cerrada'));
  }

}
