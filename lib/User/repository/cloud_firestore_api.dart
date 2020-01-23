

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padres/User/model/user.dart';

class CloudFirestoreApi{
final String USERS = 'users';
final Firestore _db = Firestore.instance;

void updateUserData(User user)async{
  DocumentReference ref = _db.collection(USERS).document(user.uid);
  return ref.setData({
  'uid'  :user.uid,
  'nombres'  :user.nombres,
  'apellido'  :user.apellido,
  'cedula'  :user.cedula,
  'photoUrl'  :user.photoUrl,
  });

}
}

