import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padres/Utils/hexaColor.dart';
import 'package:rubber/rubber.dart';

class InformacionRutas extends StatefulWidget {
  InformacionRutas({Key key}) : super(key: key);

  @override
  _InformacionRutasState createState() => _InformacionRutasState();
}

class _InformacionRutasState extends State<InformacionRutas>
    with SingleTickerProviderStateMixin {
  RubberAnimationController _controller;

  double _dampingValue = DampingRatio.HIGH_BOUNCY;
  //double _stiffnessValue = Stiffness.HIGH;

  @override
  void initState() {
    _controller = RubberAnimationController(
        dismissable: true,
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: 50),
        upperBoundValue: AnimationControllerValue(percentage: 0.8),
        springDescription: SpringDescription.withDampingRatio(
            mass: 1, stiffness: Stiffness.VERY_LOW, ratio: _dampingValue),
        duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: RubberBottomSheet(
              lowerLayer: _getLowerLayer(),
              upperLayer: _getUpperLayer(),
              animationController: _controller,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getLowerLayer() {
    return Container(
      height: 2,
      decoration: BoxDecoration(color: Colors.transparent),
    );
  }

  Widget _getUpperLayer() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80), topRight: Radius.circular(5)),
          child: Container(
            decoration: BoxDecoration(
                color: Color(hexColor('#3A4A64')).withOpacity(0.5)),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white70,
                  size: 26,
                ),
              ],
            ),
            Text(
              'Su Ruta',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  infVelocimetroRuta(),
                    Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: Colors.white70,
                        child: ListTile(
                          
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/daniel.png'),
                            radius: 20,
                          ),
                          title: Row(
                            children: <Widget>[
                              Text(
                                'Victor Daniel Granda',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                               Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.markunread, color:Color(hexColor('#5CC4B8')),),
                                onPressed: (){},
                              ),
                                IconButton(
                                icon: Icon(Icons.call, color:Color(hexColor('#5CC4B8')),),
                                onPressed: (){},
                              ),
                            ],
                          )
                            ],
                          ),
                            subtitle: Row(
                              children: <Widget>[
                                Text(
                                'Monitor de ruta',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                ),
                          ),
                              ],
                            ),
                  
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: Colors.white70,
                        child: ListTile(
                          
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/daniel.png'),
                            radius: 20,
                          ),
                          title: Row(
                            children: <Widget>[
                              Text(
                                'Victor Daniel Granda P',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                               Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.markunread, color:Color(hexColor('#5CC4B8')),),
                                onPressed: (){},
                              ),
                                IconButton(
                                icon: Icon(Icons.call, color:Color(hexColor('#5CC4B8')),),
                                onPressed: (){},
                              ),
                            ],
                          )
                            ],
                          ),
                            subtitle: Row(
                              children: <Widget>[
                                Text(
                                'Conductor de ruta',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                ),
                          ),
                              ],
                            ),
                    
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            /*     SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Text('Niño para realizar el monitoreo', )
            ],
          ),
        ) */
          ],
        )
      ],
    );
  }

  Row infVelocimetroRuta() {
    return Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Center(
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                                color: Colors.white10,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Salida',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '15:00',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 30,
                                            letterSpacing: 3,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Ene-27',
                                              style: TextStyle(
                                                fontFamily: 'Poppins-Medium',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //Expanded(child: SizedBox(width: 1,)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Ruta: 6',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '40 km/h',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 23,
                                          child: Icon(
                                            FontAwesomeIcons.tachometerAlt,
                                            color: Color(hexColor('#61B4E5')),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Llegada',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '16:00',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 30,
                                            letterSpacing: 3,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Ene-27',
                                              style: TextStyle(
                                                fontFamily: 'Poppins-Medium',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                );
  }
}
