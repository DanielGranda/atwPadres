import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:padres/2 Home_maps/view/screens/homeAtwPadres.dart';
import 'package:padres/1 User/bloc/bloc_user.dart';
import 'package:padres/1 User/services/auth_services_firebase.dart';

import 'ingreso.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    //bool loading = false;
    return StreamBuilder(
      stream: userBloc.onAuthStateChanged(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;

          if (user ==  null) {
            return   
            IngresoAtwPadres();
          }
          print('Sesión iniciada con:$user');
          return HomeAtwPadres();
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
