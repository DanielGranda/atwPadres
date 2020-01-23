import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:padres/User/services/auth_services_firebase.dart';
import 'package:padres/Utils/hexaColor.dart';
import 'package:provider/provider.dart';

class BotonIngreso extends StatefulWidget {
  const BotonIngreso({
    Key key,
    GlobalKey<FormBuilderState> ingresoPadresKey, 
  })  : _ingresoPadresKey = ingresoPadresKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _ingresoPadresKey;


  @override
  _BotonIngresoState createState() => _BotonIngresoState();
}

class _BotonIngresoState extends State<BotonIngreso> {

  @override
  Widget build(BuildContext context) {

  
                        
      Future <void> _sumitingreso() async {
        final auth = Provider.of<AuthBase>(context, listen: false);


      try {
        widget._ingresoPadresKey.currentState.saveAndValidate();
        print(
          widget._ingresoPadresKey.currentState.value,
        );

        await auth. signInWithEmailAndPassword(
            widget._ingresoPadresKey.currentState.value['email'],
            widget._ingresoPadresKey.currentState.value['Password']);
            //Navigator.of(context).pop();
      } on PlatformException catch (e) {
          AwesomeDialog(
        btnOkColor: Color(hexColor('#F6C34F')),
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        tittle: 'Verificación',
        desc:
            e.message,
        btnCancelText: 'Aceptar',
        btnCancelOnPress: () {
          
        }).show();
      } 
    }
    
    return InkWell(
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(hexColor('#F6C34F')), Color(hexColor('#F6C34F'))]),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:_sumitingreso,
            child: Center(
              child: Text("INGRESAR",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      letterSpacing: 1.0)),
            ),
          ),
        ),
      ),
    );
  }
}
