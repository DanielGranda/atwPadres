import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:padres/User/model/user.dart';
import 'package:padres/User/repository/auth_repository.dart';
import 'package:padres/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;


 //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signInGoogle() {
  return _auth_repository.signInFirebaseGoogle();
  } 
  //2. Sign Up User and Password
 /* Future<FirebaseUser> signInFirebaseWithUserAndPassword(String email, String password){
    return _auth_repository.signInWithUserAndPassword(email, password);
  }  
 */



 Future signUpHttpUser(String email, String password){
  return _auth_repository.signUpHttp(email, password);
  }  


  //3.SignOut
  signOut(){
_auth_repository.signOut();
  }

  //Caso registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  updateUserData(User user)=> _cloudFirestoreRepository.updateUserDataFirestore(user);

  @override
  void dispose() {}
}
