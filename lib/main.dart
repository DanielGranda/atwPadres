import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:padres/1 User/bloc/bloc_user.dart';
import 'package:padres/prueba.dart';

import '7 Cancelar_trayecto_estudiante/view/screen/cancelar_trayecto_estudiante.dart';

import '8 Perfil_usuario/view/screens/perfil_user.dart';
import 'Permitions/permitionGpsUI.dart';
import '1 User/view/screens/ingreso.dart';
import '1 User/view/screens/landing_page.dart';
import '1 User/view/screens/registro.dart';
import 'Utils/hexaColor.dart';
import 'package:padres/2 Home_maps/view/screens/homeAtwPadres.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'Antawa School - Padres',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('es', 'ES'), // Español
          const Locale('en', 'US'), // English
        ],
        theme: ThemeData(
          primaryColor: Color(hexColor('##F6C34F')),
          fontFamily: 'Poppins-Medium',
        ),
        /*    home: LandingPage(
        ), */
        initialRoute: 'ingreso',
        routes: {
          //Ingreso
          'ingreso': (_) => IngresoAtwPadres(),
          'registro': (_) => RegistroAtwPadres(),
          'permition': (_) => PermitionGpsUi(),
          'prueba': (_) => Prueba(),
          'nova': (_) => CancelarTrayectoEstudiante(),
          'inicio': (_) => LandingPage(),
          //Home
          'homePadres': (_) => HomeAtwPadres(),
          //Perfil
          'perfil': (_) => PerfilUserUi(),

        },
      ),
    );
  }
}
