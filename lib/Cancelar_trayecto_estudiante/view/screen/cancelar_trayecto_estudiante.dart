import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:padres/Utils/hexaColor.dart';
import 'package:rubber/rubber.dart';

class CancelarTrayectoEstudiante extends StatefulWidget {
  CancelarTrayectoEstudiante({Key key}) : super(key: key);

  @override
  _CancelarTrayectoEstudianteState createState() =>
      _CancelarTrayectoEstudianteState();
}

class _CancelarTrayectoEstudianteState extends State<CancelarTrayectoEstudiante>
    with SingleTickerProviderStateMixin {
  RubberAnimationController _controller;

  double _dampingValue = DampingRatio.NO_BOUNCY;
  //double _stiffnessValue = Stiffness.HIGH;

  @override
  void initState() {
    _controller = RubberAnimationController(
        dismissable: true,
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: 50),
        upperBoundValue: AnimationControllerValue(percentage: 0.9),
        springDescription: SpringDescription.withDampingRatio(
            mass: 1, stiffness: Stiffness.HIGH, ratio: _dampingValue),
        duration: Duration(milliseconds: 300));
    super.initState();
  }

  final GlobalKey<FormBuilderState> _misHijosNoVaKey =
      GlobalKey<FormBuilderState>();
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
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Estudiante que no va en la ruta',
                  textAlign: TextAlign.center,
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: FormBuilder(
                                key: _misHijosNoVaKey,
                                initialValue: {
                                  'date': DateTime.now(),
                                  'accept_terms': false,
                                },
                                autovalidate: true,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: FormBuilderDropdown(
                                        attribute: "hijonova",
                                        decoration: InputDecoration(
                                          labelText: "Estudiante no abordo",
                                          labelStyle: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color(hexColor('#3A4A64')),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(hexColor('#5CC4B8')),
                                        ),
                                        // initialValue: 'Male',
                                        hint: Text(
                                          '¿Estudiante que no abordará?',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 12,
                                            color: Color(hexColor('#5CC4B8')),
                                          ),
                                        ),
                                        validators: [
                                          FormBuilderValidators.required(
                                              errorText: 'Campo Obligatorio')
                                        ],
                                        items: [
                                          'Henry Urrea',
                                          'Daniel Granda',
                                          'Diego Arcos'
                                        ]
                                            .map((destinatario) =>
                                                DropdownMenuItem(
                                                    value: destinatario,
                                                    child:
                                                        Text("$destinatario")))
                                            .toList(),
                                        allowClear: true,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    FormBuilderDateTimePicker(
                                      locale: Locale('es', 'ES'),

                                      attribute: "fechaNoAsistencia",
                                      inputType: InputType.date,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(hexColor('#5CC4B8'))),
                                      //format: DateTime(),
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.date_range,
                                          color: Color(hexColor('#5CC4B8')),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Día que no asistirá",
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(hexColor('#3A4A64'))),
                                      ),
                                      validators: [
                                        FormBuilderValidators.required(
                                            errorText: 'Campo Obligatorio')
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //Botonoes
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            //Expanded(child: SizedBox()),
                                            FlatButton(
                                              onPressed: () {
                                                if (_misHijosNoVaKey
                                                    .currentState
                                                    .saveAndValidate()) {
                                                  print(
                                                    _misHijosNoVaKey
                                                        .currentState.value,
                                                  );
                                                  AwesomeDialog(
                                                      btnOkColor: Color(
                                                          hexColor('#5CC4B8')),
                                                      context: context,
                                                      dialogType:
                                                          DialogType.SUCCES,
                                                      animType:
                                                          AnimType.TOPSLIDE,
                                                      tittle:
                                                          'Registro Exitoso',
                                                      desc:
                                                          'Su notificación ha sido enviada con éxito',
                                                      //btnCancelOnPress: () {},
                                                      btnOkOnPress: () {
                                                        Navigator.pushNamed(
                                                            context, 'homePadres');
                                                      }).show();
                                                } else {
                                                  print('campos por validar');
                                                  AwesomeDialog(
                                                          btnOkColor: Color(
                                                              hexColor(
                                                                  '#E86A87')),
                                                          context: context,
                                                          dialogType:
                                                              DialogType.ERROR,
                                                          animType:
                                                              AnimType.TOPSLIDE,
                                                          tittle:
                                                              'Error de Registro ',
                                                          desc:
                                                              'Revise campos obligatorios',
                                                          //btnCancelOnPress: () {},
                                                          btnOkOnPress: () {
                                                            //Navigator.pushNamed(context, '/');
                                                          })
                                                      .show();
                                                }
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage: AssetImage(
                                                        'assets/icon/ok.png'),
                                                  ),
                                                  Text("Enviar"),
                                                ],
                                              ),
                                            ),
                                            FlatButton(
                                              child: Column(
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage: AssetImage(
                                                        'assets/icon/cancel.png'),
                                                  ),
                                                  Text("Cancelar"),
                                                ],
                                              ),
                                              onPressed: () {
                                                Navigator.popAndPushNamed(
                                                    context, 'homePadres');
                                                //_fase1Key.currentState.reset();
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          )),
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

class DateFormat {}
