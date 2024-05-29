import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/src/pages/home/home_page.dart';
import 'package:flutter_application/src/services/auth_google.dart';
import 'package:flutter_application/src/services/auth_provider.dart';


class LoginPage extends StatefulWidget {
  static const String routename = "login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  final AuthService _auth = AuthService();

@override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // email
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.height * 0.05,
                ),
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
                      return 'Por favor ingresa tu email';
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
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: size.height * 0.05,
                ),
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xFFBEBCBC),
                      fontWeight: FontWeight.w700,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Choose the icon based on the state of _obscureText
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Toggle the state of password visibility
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
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
                  
                  var result = await _auth.signInEmailAndPassword(_email, _password);

                  if(result != null){
                    Navigator.popAndPushNamed(context, HomePage.routename);
                  }



                }
              },
                child: const Text(
                  'Iniciar sesion',
                ),
              ),

              const SizedBox(height: 20),

              // FilledButton
              FilledButton.tonalIcon(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(88, 113, 179, 1)
                ),
                onPressed: () async {
                  try {
                    final user = await AuthGoogle().loginGoogle();
                    if(user != null) {
                      Navigator.pushNamed(context, HomePage.routename);
                    }
                  } on FirebaseAuthException catch(error) {
                    print(error.message);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error.message??'Ups... Algo salio mal'),
                      ),
                    );
                  } catch (error){
                    print(error);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error.toString()),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Iniciar sesion con Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}