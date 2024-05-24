import 'package:flutter/material.dart';
import 'package:flutter_application/src/pages/home/home_page.dart';
import 'package:flutter_application/src/services/auth_provider.dart';


class RegisterPage extends StatefulWidget {
  static const String routename = "register";
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // email
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * 0.1,
                  top: size.height * 0.05),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
            ),

            // password
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * 0.1,
                  bottom: size.height * 0.05),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
            ),

            // button
            ElevatedButton(
              onPressed: () async {
                               
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()==true) {
                  
                  var result = await _auth.createAccount(_email, _password);

                  if(result != null){
                    Navigator.popAndPushNamed(context, HomePage.routename);
                  }



                }
              },
              child: const Text(
                'Registro',
              ),
            )
          ],
        ),
      ),
    );
  }
}
