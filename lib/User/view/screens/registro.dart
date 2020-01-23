import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:padres/User/bloc/bloc_user.dart';
import 'package:padres/User/services/auth_services_firebase.dart';
import 'package:padres/User/view/widgets/boton_registro.dart';
import 'package:padres/User/view/widgets/cabecera_registro.dart';
import 'package:padres/User/view/widgets/fondoRegistro.dart';
import 'package:padres/User/view/widgets/formulario_registro.dart';
import 'package:padres/User/view/widgets/informacion_service.dart';
import 'package:padres/User/view/widgets/pie_registro.dart';
import 'package:padres/User/view/widgets/redes_sociales_login.dart';


class RegistroAtwPadres extends StatefulWidget {
  RegistroAtwPadres({Key key, AuthBase auth, onSignIn}) : super(key: key);

  @override
  _RegistroAtwPadresState createState() => _RegistroAtwPadresState();
}

UserBloc userBloc;

class _RegistroAtwPadresState extends State<RegistroAtwPadres> {
  final GlobalKey<FormBuilderState> _registroPadresKey =
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
                      CabeceraRegistro(),
                      FormularioRegistro(
                        auth: Auth(),
                        registroPadresKey: _registroPadresKey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          BotonRegistro
                          (
                            registroPadresKey: _registroPadresKey),
                          Expanded(
                            child: Informacion(auth: Auth()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(),
                      PieRegistro(),
                       SizedBox(
                        height: 30,
                      ),
                      RedesSocialesLogin(auth: Auth(),),
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
