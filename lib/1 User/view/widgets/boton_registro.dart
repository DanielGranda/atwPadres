import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:padres/Utils/hexaColor.dart';

class BotonRegistro extends StatefulWidget {
  const BotonRegistro({
    Key key,
    GlobalKey<FormBuilderState> registroPadresKey,
  })  : _registroPadresUiKey = registroPadresKey,
        super(key: key);
  final GlobalKey<FormBuilderState> _registroPadresUiKey;

  @override
  _BotonRegistroState createState() => _BotonRegistroState();
}

class _BotonRegistroState extends State<BotonRegistro> {
  @override
  Widget build(BuildContext context) {
    //final userBloc = BlocProvider.of<UserBloc>(context);
    void _sumitingreso() async {
      if (widget._registroPadresUiKey.currentState.saveAndValidate()) {
        print(
          widget._registroPadresUiKey.currentState.value,
        );
        AwesomeDialog(
            btnOkColor: Color(hexColor('#5CC4B8')),
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.TOPSLIDE,
            tittle: 'Verificación',
            desc: 'Registro Exitoso',
              btnOkText: 'Aceptar',
           btnOkOnPress: () {
              Navigator.popAndPushNamed(context, 'homePadres');
            }).show();
      } else {
        AwesomeDialog(
                btnCancelColor: Color(hexColor('#E86A87')),
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.TOPSLIDE,
                tittle: 'Verificación',
                desc: 'Verifique los datos para el registro',
                btnCancelText: 'Aceptar',
                btnCancelOnPress: () {})
            .show();
      }
      /*    try {

/*         await userBloc.registroWithPasswordAndEmail(
            widget._registroPadresUiKey.currentState.value['email'],
            widget._registroPadresUiKey.currentState.value['Password']).then((user) {
          userBloc.updateUserData(UserPadre(
            uid: user.uid,
            email: user.email
          ));
        });
            Navigator.of(context).pop(); */
      } on PlatformException catch (e) {
        AwesomeDialog(
                btnOkColor: Color(hexColor('#F6C34F')),
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.TOPSLIDE,
                tittle: 'Verificación',
                desc: e.message,
                btnCancelText: 'Aceptar',
                btnCancelOnPress: () {})
            .show();
      } */
      // Navigator.pushReplacementNamed(context, 'inicio');
    }

    return InkWell(
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(hexColor('#5CC4B8')),
              Color(hexColor('#5CC4B8'))
            ]),
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
            onTap: _sumitingreso,
            child: Center(
              child: Text("REGISTRAR",
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
