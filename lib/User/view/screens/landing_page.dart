import 'package:flutter/material.dart';
import 'package:padres/Home_maps/view/screens/homeAtwPadres.dart';
import 'package:padres/User/services/auth_services_firebase.dart';
import 'package:provider/provider.dart';

import 'ingreso.dart';

class LandingPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState==ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            return IngresoAtwPadres(
            );
          }
          print('Sesión iniciada con:$auth');
          return HomeAtwPadres(
          );
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
