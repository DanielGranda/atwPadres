import 'package:flutter/material.dart';

class User {
  User(
      {@required this.uid,
      @required this.nombres,
      @required this.apellido,
      @required this.cedula,
      @required this.photoUrl});

  final String uid;
  final String nombres;
  final String apellido;
  final String cedula;
  final String photoUrl;
}
