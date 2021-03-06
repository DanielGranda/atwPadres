import 'package:flutter/material.dart';
import 'package:padres/1 User/services/auth_services_firebase.dart';

class AuthProvider extends InheritedWidget{
  AuthProvider({@required this.auth, @required this.child});

  final AuthBase auth;
  final Widget child;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>false;

  static AuthBase of(BuildContext context){
    AuthProvider provider = context.dependOnInheritedWidgetOfExactType(aspect:AuthProvider );
    return provider.auth;
  }

} 