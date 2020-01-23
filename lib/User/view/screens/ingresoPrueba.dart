import 'package:flutter/material.dart';
import 'package:padres/User/services/auth_services_firebase.dart';


class IngresoPrueba extends StatelessWidget {
const IngresoPrueba({@required this.auth});
final AuthBase auth;

Future<void> _signInAnonymousle()async{
  try {
    await auth.signInAnonymously();
  } catch (e) {
    print(e.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return Material(
          child: Center(
        child: Container(
          child: IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: _signInAnonymousle,
          ),
        ),
      ),
    );
  }
}