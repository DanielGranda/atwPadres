import 'package:firebase_auth/firebase_auth.dart';
import 'package:padres/1 User/services/auth_services_firebase.dart';

//import 'firebase_auth_api.dart';

class AuthRepositoryFirebase {
  //final _firebaseAuthAPI = FirebaseAuthAPI();
  final _firebaseAuthApiService = AuthServiceFirebaseApi();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  /////////////ESTATUS//////////
Stream<User> get onAuthStateChanged{
  return _firebaseAuthApiService.onAuthStateChanged;}


  /////////////SIGN IN ANONYMOUS//////////
  Future<User>signInAnonymously() => _firebaseAuthApiService.signInAnonymously();

  /////////////SIGN IN GOOGLE//////////
  Future<User>signInWithGoogle() => _firebaseAuthApiService.signInWithGoogle();

  /////////////SIGN UP GOOGLE//////////
  Future<User>registroWithPasswordAndEmail(String email, String password) =>
      _firebaseAuthApiService.createUserWithEmailAndPassword(email, password);

  /////////////SIGN IN GOOGLE//////////
   Future<User>signInWithPasswordAndEmail(String email, String password) =>
      _firebaseAuthApiService.signInWithEmailAndPassword(email, password);

  /////////////SIGN OUT GOOGLE//////////
  Future<void>signOut() => _firebaseAuthApiService.signOut();

}
