import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:padres/1 User/services/auth_services_firebase.dart';
import 'package:padres/Utils/hexaColor.dart';

class FormularioRegistro extends StatelessWidget {
  const FormularioRegistro({
    Key key,
    GlobalKey<FormBuilderState> registroPadresKey,
    this.colorField,
    @required this.auth,
  })  : _registroPadresKey = registroPadresKey,
        super(key: key);

  final AuthBase auth;
  final GlobalKey<FormBuilderState> _registroPadresKey;
  final Color colorField;

  @override
  Widget build(BuildContext context) {
    Color colorField = Color(hexColor('#3A4A64'));
    return FormBuilder(
      key: _registroPadresKey,
      initialValue: {
        'date': DateTime.now(),
        'accept_terms': false,
      },
      autovalidate: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FormBuilderTextField(
              keyboardType: TextInputType.emailAddress,
              attribute: "email",
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.alternate_email, color: colorField),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 14, color: colorField),
                  helperStyle: TextStyle(fontSize: 12, color: colorField),
                  hintText: 'Ingrese su email'),
              style: TextStyle(fontSize: 14, color: colorField),
              validators: [
                FormBuilderValidators.required(
                  errorText: 'Requerido',
                ),
                FormBuilderValidators.email(
                    errorText: 'Debe ser un correo válido')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              keyboardType: TextInputType.emailAddress,
              attribute: "Password",
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock, color: colorField),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Contraseña",
                  labelStyle: TextStyle(fontSize: 14, color: colorField),
                  helperStyle: TextStyle(fontSize: 12, color: colorField),
                  hintText: 'Ingrese su contraseña'),
              style: TextStyle(fontSize: 14, color: colorField),
              validators: [
                FormBuilderValidators.required(
                  errorText: 'Requerido',
                ),
                FormBuilderValidators.minLength(6,
                    errorText: 'Mínimo 6 caracteres')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
