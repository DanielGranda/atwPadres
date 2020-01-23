import 'package:flutter/material.dart';
import 'package:padres/Utils/hexaColor.dart';


class Cabecera extends StatelessWidget {
  const Cabecera({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                "assets/icon/LogoPadres2.png",
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text("ANTAWA SCHOOL ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(hexColor('#5CC4B8')),
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Text('INGRESO',
                  style: TextStyle(
                      color: Color(hexColor('#F6C34F')),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6)),
            ],
          ),
        ],
      ),
    );
  }
}