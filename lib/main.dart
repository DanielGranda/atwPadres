import 'package:flutter/material.dart';
import 'package:padres/User/services/auth_services_firebase.dart';
import 'package:padres/prueba.dart';
import 'package:provider/provider.dart';

import 'Cancelar_trayecto_estudiante/view/screen/cancelar_trayecto_estudiante.dart';
import 'Home_maps/view/widgets/perfilUser.dart';
import 'Permitions/permitionGpsUI.dart';
import 'User/view/screens/ingreso.dart';
import 'User/view/screens/landing_page.dart';
import 'User/view/screens/registro.dart';
import 'Utils/hexaColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (contex)=>Auth(),
      child: MaterialApp(
        title: 'Antawa School - Padres',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(hexColor('##F6C34F')),
          fontFamily: 'Poppins-Medium',
        ),
        home: LandingPage(
        ),
        //initialRoute: 'ingreso',
        routes: {
          'ingreso': (_) => IngresoAtwPadres(),
          'registro': (_) => RegistroAtwPadres(),
          //'/': (_) => HomeAtwPadres(),
          'permition': (_) => PermitionGpsUi(),
          'prueba': (_) => Prueba(),
          'nova': (_) => CancelarTrayectoEstudiante(),
          'perfil': (_) => PerfilUserUi(),
          'inicio': (_) => LandingPage(
              ),
        },
      ),
    );
  }
}
