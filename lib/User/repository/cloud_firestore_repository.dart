

import 'package:padres/User/model/user.dart';
import 'package:padres/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreApi =  CloudFirestoreApi();

  void updateUserDataFirestore(User user)=>_cloudFirestoreApi.updateUserData(user);
  }