import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:padres/Utils/hexaColor.dart';
import 'package:vibration/vibration.dart';


class MenuLateral extends StatefulWidget {
  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    //  final userBloc = BlocProvider.of<UserBloc>(context);
    return SafeArea(
      child: Container(
        width: 270,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/marce.png'),
              radius: 50,
            ),
            /*     StreamBuilder(
            stream: Firestore.instance
                .collection('user')
                .document(user.uid)
                .collection('registroMonitorEps')
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return CircleAvatar(
                  backgroundImage: NetworkImage('${user.photoUrl}'),
                  radius: 50,
                );
              }
            },
          ),
          SizedBox(height: 15), */
            Divider(
              height: 15,
              color: Color(hexColor('#3A4A64')),
              thickness: 5,
            ),
            SizedBox(height: 5),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon/perfil.png'),
                  radius: 25,
                ),
                title: Text(
                  'Perfil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 12,
                    color: Color(hexColor('#3A4A64')),
                  ),
                ),
                trailing: Icon(
                  (Icons.arrow_forward_ios),
                ),
                onTap: () async {
                  Navigator.pushNamed(context, 'perfil');
                  if (await Vibration.hasVibrator()) {
    Vibration.vibrate();
}
                },
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon/config.png'),
                  radius: 25,
                ),
                title: Text(
                  'Configuraciones',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 12,
                    color: Color(hexColor('#3A4A64')),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigator.pushNamed(context, 'prueba');
                },
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon/exit.png'),
                  radius: 25,
                ),
                title: Text(
                  'Cerrar Sesión',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 12,
                    color: Color(hexColor('#3A4A64')),
                  ),
                ),
                trailing: Icon(
                  (Icons.arrow_forward_ios),
                ),
                onTap: () {
                  AwesomeDialog(
                      btnOkColor: Color(hexColor('#F6C34F')),
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.TOPSLIDE,
                      tittle: 'Cerrar Sesión',
                      desc: '¿Desea cerrar la sesión',
                      btnOkText: 'Aceptar',
                      btnCancelColor: Color(hexColor('#E86A87')),
                      btnOkOnPress: () async {
                           Navigator.popAndPushNamed(context, 'ingreso');
                           if (await Vibration.hasVibrator()) {
    Vibration.vibrate();
}
                      
                     /*    try {
                          await userBloc.signOut();
                          Navigator.pop(context);
                        } catch (e) {
                          print(e.toString());
                        } */
                      },
                      btnCancelText: 'Cancelar',
                      btnCancelOnPress: () async {
                        Navigator.of(context).pop();
                        if (await Vibration.hasVibrator()) {
    Vibration.vibrate();
}
                      }).show();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
