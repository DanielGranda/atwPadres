import 'package:flutter/material.dart';
import 'package:padres/Utils/hexaColor.dart';

class PieIngreso extends StatelessWidget {
  const PieIngreso({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¿Necesitas una cuenta:?',
          style: TextStyle(color: Color(hexColor('#3A4A64')).withOpacity(0.5)),
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
            child: Text(
          'Crear Cuenta',
          style: TextStyle(fontSize: 16, color: Color(hexColor('#3A4A64'))),
        ),
        onTap: (){
          Navigator.pushNamed(context, 'registro');
        },
        
        ),
      ],
    );
  }
}
