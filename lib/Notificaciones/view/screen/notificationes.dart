import 'package:flutter/material.dart';
import 'package:padres/Utils/hexaColor.dart';
import 'package:rubber/rubber.dart';

class Notificationes extends StatefulWidget {
  Notificationes({Key key}) : super(key: key);

  @override
  _NotificationesState createState() => _NotificationesState();
}

class _NotificationesState extends State<Notificationes>
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
        upperBoundValue: AnimationControllerValue(percentage: 0.9),
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
                 onTap: () {},
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
          borderRadius: BorderRadius.only(topLeft:Radius.circular(80),topRight:Radius.circular(5)),
                  child: Container(
            decoration: BoxDecoration(color: Color(hexColor('#3A4A64')).withOpacity(0.5)),
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
            Row(
              children: <Widget>[
                SizedBox(width: 30,),
                Text(
                  'Sus notificaciones',textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
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
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list,     color: Colors.white,),
                        onPressed: (){},
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: Colors.white70,
                        child: ListTile(
                          
                          leading: CircleAvatar(
                            backgroundColor: Color(hexColor('#5CC4B8')),
                          child: Icon(Icons.timer_off, color: Colors.white,),
                          
                            radius: 20,
                          ),
                          title: Text(
                            'Retraso de 10 minutos',textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          subtitle:  Text(
                            'Novedad en ruta',textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 10,
                              color: Colors.blueGrey,
                            ),
                          ),
                                trailing:  Text(
                            '05-ene',textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 10,
                              color: Colors.blueGrey,
                            ),
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

  
}
