
import 'package:flutter/material.dart';
import 'package:padres/8 Perfil_usuario/view/widgets/avatar_estudiantes.dart';
import 'package:padres/8 Perfil_usuario/view/widgets/cabecera_perfil.dart';
import 'package:padres/8 Perfil_usuario/view/widgets/formulario_perfil.dart';
import 'package:padres/8 Perfil_usuario/view/widgets/tarjeta_perfil.dart';
import 'package:padres/1 User/bloc/bloc_user.dart';
import 'package:padres/1 User/view/widgets/fondoRegistro.dart';
import 'package:padres/Utils/hexaColor.dart';

class PerfilUserUi extends StatefulWidget {
  @override
  _PerfilUserUiState createState() => _PerfilUserUiState();
}

UserBloc userBloc;

class _PerfilUserUiState extends State<PerfilUserUi> {
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
                      CabeceraPerfil(),
                      TarjetaPerfilFoto(),
                      SizedBox(
                        height: 10,
                      ),
                      FormularioPerfil(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Estudiantes en Monitoreo',
                        style: TextStyle(
                            color: Color(hexColor('#F6C34F')),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Divider(),
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AvatarEstudiante(),
                          SizedBox( width: 30),
                          AvatarEstudiante(),
                        ],
                      ),
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
