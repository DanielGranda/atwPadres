import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:padres/1 User/bloc/bloc_user.dart';
import 'package:padres/1 User/services/auth_services_firebase.dart';
import 'package:padres/1 User/view/widgets/boton_ingreso.dart';
import 'package:padres/1 User/view/widgets/cabecera_ingreso.dart';
import 'package:padres/1 User/view/widgets/fondoRegistro.dart';
import 'package:padres/1 User/view/widgets/formulario_ingreso.dart';
import 'package:padres/1 User/view/widgets/pie_ingreso.dart';

class IngresoAtwPadres extends StatefulWidget {
  IngresoAtwPadres({Key key, AuthBase auth, onSignIn}) : super(key: key);

  @override
  _IngresoAtwPadresState createState() => _IngresoAtwPadresState();
}

UserBloc userBloc;

class _IngresoAtwPadresState extends State<IngresoAtwPadres> {
  final GlobalKey<FormBuilderState> _ingresoPadresKey =
      GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FondoRegistro(),
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Cabecera(),
                      FormularioIngreso(
                        ingresoPadresKey: _ingresoPadresKey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          BotonIngreso(
                            ingresoPadresKey: _ingresoPadresKey,
                          ),
                    /*       Expanded(
                            child: Informacion(auth: AuthServiceFirebaseApi()),
                          ), */
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(),
                      PieIngreso(),
                      SizedBox(
                        height: 30,
                      ),
              /*         RedesSocialesLogin(
                        auth: AuthServiceFirebaseApi(),
                      ), */
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
