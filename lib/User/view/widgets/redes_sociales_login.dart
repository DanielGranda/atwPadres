import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padres/User/services/auth_services_firebase.dart';
import 'package:padres/Utils/hexaColor.dart';
import 'package:padres/Utils/socialIcons.dart';

class RedesSocialesLogin extends StatefulWidget {
 const RedesSocialesLogin({@required this.auth});
final AuthBase auth;

  @override
  _RedesSocialesLoginState createState() => _RedesSocialesLoginState();
}

class _RedesSocialesLoginState extends State<RedesSocialesLogin> {
Future<void> _signInWithGoogle()async{
  try {
    await widget.auth.signInWithGoogle();
  } catch (e) {
    print(e.toString());
  } 
}

  @override
  Widget build(BuildContext context) {
  //userBloc = BlocProvider.of(context);
    Color colorField = Color(hexColor('#3A4A64'));
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Color(hexColor('#3A4A64')).withOpacity(0.5),
                  height: 2,
                  width: 60,
                ),
                Text("Social Login",
                    style: TextStyle(
                        color: colorField,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        fontFamily: "Poppins-Medium")),
                Container(
                  color: Color(hexColor('#3A4A64')).withOpacity(0.5),
                  height: 2,
                  width: 60,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*      SocialIcon(
               colors: [
                 Color(0xFF102397),
                 Color(0xFF187adf),
                 Color(0xFF00eaf8),
               ],
               iconData: FontAwesome.facebook_f,
               onPressed: () {},
             ), */
            SocialIcon(
              colors: [
                Color(0xFFff4f38),
                Color(0xFFff355d),
              ],
              iconData: FontAwesomeIcons.google,
              onPressed: 
                _signInWithGoogle
                //userBloc.signInGoogle();

                //Navigator.pushNamed(context, '/');
              
            ),
            /*  SocialIcon(
           colors: [
             Color(0xFF17ead9),
             Color(0xFF6078ea),
           ],
           iconData: FontAwesome.linkedin,
           onPressed: () {},
         ),
         SocialIcon(
           colors: [
             Color(0xFF00c6fb),
             Color(0xFF005bea),
           ],
           iconData: FontAwesome.whatsapp,
           onPressed: () {},
         ) */
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
