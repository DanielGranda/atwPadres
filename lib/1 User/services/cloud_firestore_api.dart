

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padres/1 User/model/user.dart';

class CloudFirestoreApi{
final String USERS = 'users';
final Firestore _db = Firestore.instance;

void updateUserData(UserPadre user)async{
  DocumentReference ref = _db.collection(USERS).document(user.uid);
  return ref.setData({
  'uid'  :user.uid,
  'nombres'  :user.nombres,
  'apellido'  :user.email,
  'photoUrl'  :user.photoUrl,
  'lastSignIn'  :DateTime.now(),
  },  merge: true).then((value)=>print('Se ha grabado la siguiente información en base de datos: $ref '));


}
}

