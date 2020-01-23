import 'package:flutter/material.dart';
import 'package:padres/Utils/hexaColor.dart';

class PieRegistro extends StatelessWidget {
  const PieRegistro({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¿Ya tienes una cuenta:?',
          style: TextStyle(color: Color(hexColor('#3A4A64')).withOpacity(0.5)),
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
            child: Text(
          'Ingresar',
          style: TextStyle(fontSize: 16, color: Color(hexColor('#3A4A64'))),
        ),
        onTap: (){
          Navigator.pushNamed(context, 'ingreso');
        },
        
        ),
      ],
    );
  }
}
