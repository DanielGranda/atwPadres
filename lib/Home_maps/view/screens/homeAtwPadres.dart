import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import "dart:ui" as ui;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:padres/Cancelar_trayecto_estudiante/view/screen/cancelar_trayecto_estudiante.dart';
import 'package:padres/Home_maps/view/widgets/menu_lateral.dart';
import 'package:padres/Informacion_estudiante/view/screen/informacion_estudiante.dart';
import 'package:padres/Informacion_ruta/view/screen/informacion_ruta.dart';
import 'package:padres/Notificaciones/view/screen/notificationes.dart';
import 'package:padres/Quejas/view/screen/Quejas.dart';
import 'package:padres/Utils/bottonBar/circularBotton.dart';
import 'package:padres/Utils/bottonBar/tabItem.dart';
import 'package:padres/Utils/hexaColor.dart';
import 'package:padres/Utils/stylesMaps.dart';

class HomeAtwPadres extends StatefulWidget {
  HomeAtwPadres({Key key, this.title, void Function() onSignOut})
      : super(key: key);
  final String title;

  @override
  _HomeAtwPadresState createState() => _HomeAtwPadresState();
}

class _HomeAtwPadresState extends State<HomeAtwPadres> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem('assets/icon/MisHijosIco.png', "Mis Hijos", Colors.blue,
        labelStyle: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(hexColor('#5CC4B8')),
        )),
    new TabItem('assets/icon/IcoMapaR.png', "Mi Ruta", Colors.blue,
        labelStyle: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(hexColor('#5CC4B8')),
        )),
    new TabItem('assets/icon/NotificacionesIco.png', "Mensajes", Colors.blue,
        labelStyle: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(hexColor('#5CC4B8')),
        )),
    new TabItem('assets/icon/QuejasIco.png', "Quejas", Colors.blue,
        labelStyle: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(hexColor('#5CC4B8')),
        )),
    new TabItem(
        'assets/icon/CancelarIco.png', "Cancelar Recorrido", Colors.blue,
        labelStyle: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(hexColor('#5CC4B8')),
        )),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _loadCarPin();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  GoogleMapController _mapController;
  Uint8List _carPin;
  Marker _myMarker;
  StreamSubscription<Position> _positionStream;
  Map<MarkerId, Marker> _markers = Map();
  Map<PolylineId, Polyline> _polylines = Map();
  List<LatLng> _myRoute = List();
  Position _lastPosition;

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  _loadCarPin() async {
    final byteData = await rootBundle.load('assets/icon/busAtw.png');
    _carPin = byteData.buffer.asUint8List();

    final codec = await ui.instantiateImageCodec(_carPin, targetWidth: 80);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    _carPin = (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
    _startTracking();
  }

  _startTracking() {
    final geolocator = Geolocator();
    final locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 5);

    _positionStream =
        geolocator.getPositionStream(locationOptions).listen(_onLocationUpdate);
  }

  _onLocationUpdate(Position position) {
    if (position != null) {
      final myPosition = LatLng(position.latitude, position.longitude);
      _myRoute.add(myPosition);

      final myPolyline = Polyline(
          polylineId: PolylineId("me"),
          points: _myRoute,
          color: Colors.cyanAccent,
          width: 8);

      if (_myMarker == null) {
        final markerId = MarkerId("me");
        final bitmap = BitmapDescriptor.fromBytes(_carPin);
        _myMarker = Marker(
            markerId: markerId,
            position: myPosition,
            icon: bitmap,
            rotation: 0,
            anchor: Offset(0.5, 0.5));
      } else {
        final rotation = _getMyBearing(_lastPosition, position);
        _myMarker = _myMarker.copyWith(
            positionParam: myPosition, rotationParam: rotation);
      }

      setState(() {
        _markers[_myMarker.markerId] = _myMarker;
        _polylines[myPolyline.polylineId] = myPolyline;
      });
      _lastPosition = position;
      _moveMarkerMap(position);
    }
  }

  /* Rotador de Pin */
  double _getMyBearing(Position lastPosition, Position currentPosition) {
    final dx = math.cos(math.pi / 180 * lastPosition.latitude) *
        (currentPosition.longitude - lastPosition.longitude);
    final dy = currentPosition.latitude - lastPosition.latitude;
    final angle = math.atan2(dy, dx);
    return 90 - angle * 180 / math.pi;
  }

  @override
  void dispose() {
    if (_positionStream != null) {
      _positionStream.cancel();
      _positionStream = null;
    }
    _navigationController.dispose();
    super.dispose();
  }

  _moveMarkerMap(Position position) {
    try {
      final cameraUpdate =
          CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude));
      _mapController.animateCamera(cameraUpdate);
    } catch (e) {
      print(e.toString());
    }
  }

  _updateMarkerPosition(MarkerId markerId, LatLng p) {
    print("newPosition");
    _markers[markerId] = _markers[markerId].copyWith(positionParam: p);
  }

  _onTapMArker(LatLng p) {
    final id = "${_markers.length}";
    final marketId = MarkerId(id);
    final infoWindow = InfoWindow(
        title: "Estudiante: $id", snippet: "${p.latitude}, ${p.longitude}");
    final marker = Marker(
        markerId: marketId,
        position: p,
        infoWindow: infoWindow,
        anchor: Offset(0.5, 1),
        onTap: () {
          callEstudents();
          print("clicked info$id");
        });
    setState(() {
      _markers[marketId] = marker;
    });
    print("p:${p.latitude}, ${p.longitude} ");
  }

  Future callEstudents() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Estudiante:'),
            content: Text(''),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.perm_contact_calendar),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Daniel Granda'),
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {},
                  ),
                  /*   IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {},
                  ) */
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: cabecera(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: Set.of(_markers.values),
            polylines: Set.of(_polylines.values),
            onTap: _onTapMArker,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
              _mapController
                  .setMapStyle(jsonEncode(mapStyle4)); /* Escoger 1-2-3 */
            },
          ),
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  AppBar cabecera() {
    return AppBar(
        centerTitle: true,
        backgroundColor: Color(hexColor('#F6C34F')),
        title: ListTile(
          trailing: CircleAvatar(
            backgroundImage: AssetImage('assets/marce.png'),
          ),
          title: Text(
            'Granda Jaramillo Luis M...',
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Representante Legal',
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 12,
                //fontWeight: FontWeight.bold,
                color: Color(hexColor('#3A4A64'))),
          ),
        ));
  }

  Widget bodyContainer() {
    //Color selectedColor = tabItems[selectedPos].circleColor;
    //String slogan;
    Widget body;
    switch (selectedPos) {
      case 0:
        body = InformacionEstudiantes();
        break;
      case 1:
        body = InformacionRutas();
        break;
      case 2:
        body = Notificationes();
        break;
      case 3:
        body = Quejas();
        break;
      case 4:
        body = CancelarTrayectoEstudiante();
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        //color: selectedColor,
        child: Center(
            child: Container(
          child: body,
        )),
      ),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value++;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          //print(_navigationController.value);
        });
      },
    );
  }
}
