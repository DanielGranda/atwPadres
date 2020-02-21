

import 'package:padres/1 User/model/user.dart';
import 'package:padres/1 User/services/cloud_firestore_api.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreApi =  CloudFirestoreApi();

  void updateUserDataFirestore(UserPadre user)=>_cloudFirestoreApi.updateUserData(user);
  }