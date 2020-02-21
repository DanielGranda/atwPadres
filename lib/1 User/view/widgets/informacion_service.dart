import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padres/1 User/services/auth_services_firebase.dart';
import 'package:padres/Utils/hexaColor.dart';
import 'package:padres/Utils/socialIcons.dart';

class Informacion extends StatelessWidget {
 const Informacion({@required this.auth});
final AuthBase auth;


Future<void> _signInAnonymousle()async{
  try {
    await auth.signInAnonymously();
    print('object');
  } catch (e) {
    print(e.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return SocialIcon(
      colors: [
        Color(hexColor('#F6C34F')),
        Color(hexColor('#F6C34F')).withOpacity(0.5),
      ],
      iconData: FontAwesomeIcons.info,
      onPressed: 
        _signInAnonymousle,
  
      
    );
  }
}
