import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:padres/1 User/model/user.dart';
import 'package:padres/1 User/repository/auth_repository.dart';
import 'package:padres/1 User/repository/cloud_firestore_repository.dart';
import 'package:padres/1 User/services/auth_services_firebase.dart';

class UserBloc implements Bloc {
final _authRepositoryFirebase = AuthRepositoryFirebase();

  /////////////ESTADO DE USUARIO//////////
 Stream<User> onAuthStateChanged() => _authRepositoryFirebase.onAuthStateChanged;
 
 
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  /////////////SIGN IN ANONYMOUS//////////
  Future<User>signInAnonymously() => _authRepositoryFirebase.signInAnonymously();
 
   /////////////SIGN IN GOOGLE//////////////
   Future<User>signInWithGoogle() => _authRepositoryFirebase.signInWithGoogle();

  /////////////SIGN UP PASSOORD//////////
  Future<User>registroWithPasswordAndEmail(String email, String password) =>
      _authRepositoryFirebase.registroWithPasswordAndEmail(email, password);

  /////////////SIGN IN PASSWORD//////////
  Future<User>signInWithPasswordAndEmail(String email, String password) =>
      _authRepositoryFirebase.signInWithPasswordAndEmail(email, password);

  /////////////SIGN OUT GOOGLE//////////
   Future<void>signOut() => _authRepositoryFirebase.signOut();

 /////////////REGISTRO BASDE DE DATOS USER//////////
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  updateUserData(UserPadre user)=> _cloudFirestoreRepository.updateUserDataFirestore(user);

  @override
  void dispose() {}
}
